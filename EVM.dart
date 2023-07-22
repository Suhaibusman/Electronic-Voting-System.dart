//Muhammad Suhaib Usman
//Mehdi Anthani

import 'dart:io';

int? voterCNIC;
bool isVoter =true;
List totalVoters =[];
List candidate =[];
List poolingAgent =[{
  "username": "suhaib" , "password" : "suhaib12" ,"party":"ppp"
},
{"username": "mehdi" , "password" : "mehdi12","party":"pti"}];
List cnicNumb = [];
List ptiVoter = [42201,42301];
List pmlnVoter = [];
List pppVoter = [1,3,23,4,2,32];
List mqmVoter = [];
List independentVoter = [];
List Votinglist = [{"cnic:" :"42201" ,"party":ptiVoter}];
bool isloginCEC = false;
bool isRunning = true;
bool CECCanidateWindow = false;
bool CECPAWindow = false;
bool CECVoterWindow = false;
bool isLoginPA = false;

void main() {

run();
  
}

run(){
  
  while (isRunning) {
    print("============ ELECTRONIC VOTING SYSTEM ============");
    print("Login as Cheif Election Commission. Press 1");
    print("Login as a Polling Agent. Press 2");
    print("to Cast your Vote. Press 3");
    print("Press Any Key to Stop Program");

    //first input to determine role.
    var input1 = stdin.readLineSync();
    if (input1 == "1") {
      cecFunctions();
    } else if (input1 == "2") {
      pollingAgentFunctions();
    } else if (input1 == "3") {
      VoterFunctions();
    } else {
      print("============Program Endeed!============");
      
    exit(0);
    }
  }
}

cecFunctions() {
  stdout.write("Enter Username: ");
  var inputUser = stdin.readLineSync();
  stdout.write("Enter Password: ");
  var inputPass = stdin.readLineSync();
  if (inputUser == "admin" && inputPass == "admin") {
    isloginCEC = true;
    print("============Login Successfull============");

    while (isloginCEC) {
    print("Press 1 for Canidates Menu."); 
    print("Press 2 for  Polling Agents Menu.");
    print("Press 3 for Voters Menu.");
    print("Press Any Key to Main Menu.");
      var cecInput = stdin.readLineSync();
      if (cecInput == "1") {
        CECCanidateWindow = true;
        while(CECCanidateWindow){
        print("Press 1 to add a Canidate.");
        print("Press 2 to check Canidate List.");
        print("Press 3 to update Canidate Details.");
        print("Press 4 to delete Canidate Details.");
        print("Press 0 to back to the previous Window.");

        var cecInputForCanidate = stdin.readLineSync();
        if (cecInputForCanidate == "1") {
          addCanidate();
        } else if (cecInputForCanidate == "2") {
          viewCanidate();
        } else if (cecInputForCanidate == "3") {
          updateCanidate();
        } else if (cecInputForCanidate == "4") {
          deleteCanidate();
        } else {
          CECCanidateWindow = false;
        }
        }
      } else if (cecInput == "2") {
        CECPAWindow = true;
        while(CECPAWindow){
        print("Press 1 to add a Polling Agent.");
        print("Press 2 to check Polling Agent List.");
        print("Press 3 to update Polling Agent Details.");
        print("Press 4 to delete Polling Agent Details.");
        print("Press 0 to back to the previous Window.");

        var cecInputForPA = stdin.readLineSync();
        if (cecInputForPA == "1") {
          addPA();
        } else if (cecInputForPA == "2") {
          viewPA();
        } else if (cecInputForPA == "3") {
          updatePA();
        } else if (cecInputForPA == "4") {
          deletePA();
        } else {
          CECPAWindow = false;
        }
        }
      } else if (cecInput == "3") {
        CECVoterWindow = true;
        while(CECVoterWindow){
        print("Press 1 to add a Voter Details.");
        print("Press 2 to check Voter List.");
        print("Press 3 to update Voter Details.");
        print("Press 4 to delete Voter Details.");
        print("Press 0 to back to the previous Window.");

        var cecInputForVoter = stdin.readLineSync();
        if (cecInputForVoter == "1") {
          addVoter();
        } else if (cecInputForVoter == "2") {
          viewVoter();
        } else if (cecInputForVoter == "3") {
          updateVoter();
        } else if (cecInputForVoter == "4") {
          deleteVoter();
        } else {
          CECVoterWindow = false;
        }
      }
      } else {
        print("Logout  Successfully.");
        isloginCEC = false;
      }
    }
  }
}

addCanidate(){
  print("Enter a Candidate name: ");
  var candidateInput =stdin.readLineSync();
  candidate.add(candidateInput);
print("$candidateInput Value is Added Succesfully");
  print("========================================");
}
viewCanidate(){
  print("Candidates List: ");
stdout.write(candidate);
}
updateCanidate(){
  for (var i = 0; i < candidate.length; i++) {
    print("Index: $i and Name is ${candidate[i]}");
  }
  print("Enter Index to update Candidate name: ");
  int candidateIndex =int.parse(stdin.readLineSync()!);
  print("Enter updated name: ");
  var candidateUpdatedName = stdin.readLineSync();
  candidate[candidateIndex]= candidateUpdatedName;
print("$candidateIndex Index Value is Updated Succesfully");
  print("================================================");
}
deleteCanidate(){
  for (var i = 0; i < candidate.length; i++) {
    print("Index: $i and Name is ${candidate[i]}");
  }
  print("Enter Index to Delete Candidate : ");
  int candidateIndex =int.parse(stdin.readLineSync()!);
  candidate.removeAt(candidateIndex);
  print("$candidateIndex Index Value is Deleted Succesfully");
  print("==================================================");
}

addPA(){
  print("Enter Your UserName to Add: ");
var poolingIdInput =stdin.readLineSync();
   print("Enter Your Password: ");
   var poolingPassInput =stdin.readLineSync();
   print("Please Enter a Party for $poolingIdInput ");
  var newPartyValue = stdin.readLineSync();
  poolingAgent.add({'username': poolingIdInput, 'password': poolingPassInput ,'party':newPartyValue});
  print("Username: $poolingIdInput and Password: $poolingPassInput added successfully");
    print("==================================================");
  }

viewPA(){

print(poolingAgent);
    print("==================================================");
}
updatePA(){
  for (var i = 0; i < poolingAgent.length; i++) {
    print("Index: $i and value is ${poolingAgent[i]}");
  }
  print("please enter index number to update username and password");
  int inputPool =int.parse(stdin.readLineSync()!);
  print("Please Enter a name of username: ");
  var newUserNameValue = stdin.readLineSync();
   print("Please Enter a password for $newUserNameValue: ");
  var newPasswordValue = stdin.readLineSync();
  print("Please Enter a Party for $newUserNameValue: ");
  var newPartyValue = stdin.readLineSync();
  poolingAgent[inputPool]["username"]=newUserNameValue;
  poolingAgent[inputPool]["password"]=newPasswordValue;
  poolingAgent[inputPool]["party"]=newPartyValue;
print("Username: $newUserNameValue and Password: $newPasswordValue Updated Successfully on the index number : $inputPool and Party is $newPartyValue");
    print("==================================================");
}
deletePA(){
   for (var i = 0; i < poolingAgent.length; i++) {
    print("Index: $i and value is ${poolingAgent[i]}");
  }
   print("please enter index number to delete username and password");
  int inputPool =int.parse(stdin.readLineSync()!);
  poolingAgent.removeAt(inputPool);
  print("$inputPool index value Deleted Succesfully");
    print("==================================================");
}

addVoter(){
  
  print("Enter Cnic Number of Voter :");
int cnicInputs =int.parse(stdin.readLineSync()!);
cnicNumb.add(cnicInputs);
print("$cnicInputs Value is Added Succesfully");
    print("====================================");
}
viewVoter(){
  print("List of Voters.");
  print(cnicNumb);
      print("==================================================");
}
updateVoter(){
  for (var i = 0; i < cnicNumb.length; i++) {
    print("Index: ${i} Value: ${cnicNumb[i]}");
  }
  print("Enter Index Number for update.");
  int indexNumb =int.parse(stdin.readLineSync()!);
print("Enter Updated Cnic Number to $indexNumb index number");
  var updatedCnic =stdin.readLineSync();

  cnicNumb[indexNumb] = updatedCnic;
  print("$indexNumb Index Value is Updated Succesfully");
  print("=============================================");
}
deleteVoter(){
  for (var i = 0; i < cnicNumb.length; i++) {
    print("Index: ${i} Value: ${cnicNumb[i]}");
  }
  print("Enter Index Number To Delete Value: ");
   int indexNumb =int.parse(stdin.readLineSync()!);
  cnicNumb.removeAt(indexNumb);
  print("$indexNumb Index Value is Deleted Succesfully");
    print("============================================");
}


pollingAgentFunctions() {
  stdout.write("Enter Username: ");
  var inputUser = stdin.readLineSync();
  stdout.write("Enter Password: ");
  var inputPass = stdin.readLineSync();
  for (var pa in poolingAgent) {
    if (inputUser == pa["username"] && inputPass == pa["password"]) {
      isLoginPA = true;
      if (pa["party"]=="pti") {
        totalVoters=ptiVoter;
      } else if(pa["party"]=="ppp"){
         totalVoters=pppVoter;
      }else if(pa["party"]=="pmln"){
         totalVoters=pmlnVoter;
      }else if(pa["party"]=="mqm"){
         totalVoters=mqmVoter;
      }else if(pa["party"]=="independent"){
         totalVoters=independentVoter;
      }
    print("============Login Successfull============");
    
    }
  
    while (isLoginPA == true)  {

    print("Press 1 to view Total votes gain by your Party.");
    print("Press 2 to know the total Votes Cast.");
    print("Press Any Key to Stop Program");
      var PAinput = stdin.readLineSync();
      if (PAinput == "1") {
        partyVotes();
      }
      else if( PAinput == "2"){
        totalVotes();
      }
      else{
        isLoginPA = false;
      }
    }
  }
}
VoterFunctions() {
  stdout.write("Enter your CNIC Number: ");
   voterCNIC = int.parse(stdin.readLineSync()!);
//agr list me add 
for (int i=0;i<cnicNumb.length;i++) {
  if (voterCNIC == cnicNumb[i]) {
    print("Now you can cast your vote");
    isVoter = true;
     isloginCEC = false;
  }else{
    print("Please Contact With Election Commision for cnic entry");
    isVoter =false;
    isloginCEC = true;
  break;
  }
}
while (isVoter ==true) {
  print("Press 1 to Vote PTI.");
    print("Press 2 to Vote PPP.");
    print("Press 3 to Vote PMLN.");
      var voterInput = stdin.readLineSync();
    if(voterInput == "1"){
      ptiVoter.add(voterCNIC);
      print("You vote has been casted for PTI.");
      print("=================================");
      isVoter ==false;
    isloginCEC = true;
    run();
  
    }
    else if(voterInput == "2"){
       pppVoter.add(voterCNIC);
      print("You vote has been casted for PPP.");
     
      print("=================================");
      isVoter ==false;
      isloginCEC = true;
      run();
    }
    else if(voterInput == "3"){
       pmlnVoter.add(voterCNIC);
      print("You vote has been casted for PMLN.");
     
          print("==============================");
    isloginCEC = true;
    isVoter ==false;
    run();
    }
    else {
      print("Your vote has not been casted. Please try again.");
          print("============================================");
          isloginCEC = true;
           isVoter ==false;
    run();
    }
}


}

partyVotes(){
  print("Your Party Total Votes: ");
if (totalVoters ==ptiVoter) {
  print(ptiVoter.length);
}else if(totalVoters ==pppVoter) {
  print(pppVoter.length);
}else if(totalVoters ==pmlnVoter) {
  print(pmlnVoter.length); 

}
      print("==================================================");
}

totalVotes(){
  print("Total votes of all party.");

int list1Length = ptiVoter.length;
  int list2Length = pppVoter.length;
  int list3Length = pmlnVoter.length;
  int list4Length = mqmVoter.length;
  int list5Length = independentVoter.length;

  List<int> mergedList = [];
  mergedList = [...ptiVoter, ...pppVoter, ...pmlnVoter, ...mqmVoter, ...independentVoter];

  // Print the length of each list and the merged list.
  print("The Voter of PTI is ${list1Length}.");
  print("The Voter of PPP is ${list2Length}.");
  print("The Voter of PMLN is ${list3Length}.");
  print("The Voter of MQM is ${list4Length}.");
  print("The Voter of INDEPENDENT is ${list5Length}.");
  print("The Total Voter of ALL Party is ${mergedList.length}.");

    print("==================================================");
}



highestvotes(){
   int max = findMaxListLength([ptiVoter, pmlnVoter, pppVoter, mqmVoter, independentVoter]);
  print("The highest vote value is: $max");
}

int findMaxListLength(List<List> lists) {
  int maxLength = 0;

  for (List list in lists) {
    if (list.length > maxLength) {
      maxLength = list.length;
    }
  }

  return maxLength;
}