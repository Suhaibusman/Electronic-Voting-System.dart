import 'dart:io';
enum party {pti, ppp, pmln, mqm, independent}
int? voterCNIC;
bool isVoter = true;
List totalVoters = [];
List candidate = [
  {"name": "Imran Khan", "party": party.pti},
  {"name": "Bilawal Bhutto", "party": party.ppp},
  {"name": "Nawaz Sharif", "party": party.pmln},
  {"name": "Altaf Hussain", "party": party.mqm},
  {"name": "Independent", "party": party.independent,}];
List poolingAgent = [
  {"cnic" : 4220111569725 ,"username": "suhaib", "password": "suhaib", "party":party.mqm},
  {"cnic" : 4220111569726 ,"username": "sumair", "password": "sumair", "party": party.pti},
   {"cnic" : 4220111569727 ,"username": "asim", "password": "asim", "party": party.pti},
   {"cnic" : 4220111569728 ,"username": "arqum", "password": "arqum", "party": party.pmln},
];
List cnicNumb = [4220111569725,4220111569725,4220111569725,];
List ptiVoter = [42201, 42301];
List pmlnVoter = [];
List pppVoter = [1, 3, 23, 4, 2, 32];
List mqmVoter = [];
List independentVoter = [];
bool isloginCEC = false;
bool isRunning = true;
bool CECCanidateWindow = false;
bool CECPAWindow = false;
bool CECVoterWindow = false;
bool isLoginPA = false;

void main() {
  run();
}

run() {
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
        while (CECCanidateWindow) {
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
        while (CECPAWindow) {
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
        while (CECVoterWindow) {
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
  }else{
    print("Invalid Credentials. Please try again.");
  }
}

addCanidate() {
  print("Enter a Candidate name: ");
  var candidateInput = stdin.readLineSync();
  print("Please select a party for $candidateInput:");

  for (var i = 0; i < party.values.length; i++) {
    print("${i + 1}. ${party.values[i].name.toUpperCase()}");
  }

  var partyInput = stdin.readLineSync();
  int? selectedPartyIndex = int.tryParse(partyInput ?? '');
  if (selectedPartyIndex == null || selectedPartyIndex < 1 || selectedPartyIndex > party.values.length) {
    print("Invalid selection. Please try again.");
    return;
  }

  candidate.add({
    'name': candidateInput,
    'party': party.values[selectedPartyIndex - 1], // Save enum value directly
  });
  print("$candidateInput Value is Added Succesfully");
  print("========================================");
}

viewCanidate() {
  print("Candidates List: $candidate");
  // stdout.write(candidate);
}

void updateCanidate() {
  if (candidate.isEmpty) {
    print("No candidates available to update.");
    return;
  }

  print("Available Candidates:");
  for (var i = 0; i < candidate.length; i++) {
    print("Index $i: Name: ${candidate[i]["name"]}, Party: ${candidate[i]["party"]}");
  }

  print("Enter the index of the candidate to update:");
  var inputIndex = stdin.readLineSync();
  int? index = int.tryParse(inputIndex ?? '');

  if (index == null || index < 0 || index >= candidate.length) {
    print("Invalid index. Please try again.");
    return;
  }

  print("1. Update Name");
  print("2. Update Party");
  var choice = stdin.readLineSync();
  if (choice == "1") {
    print("Enter new name:");
    var newName = stdin.readLineSync();
    if (newName != null && newName.isNotEmpty) {
      candidate[index]["name"] = newName;
      print("Candidate name updated successfully.");
    } else {
      print("Invalid name. Update canceled.");
    }
  } else if (choice == "2") {
    print("Please select a new party:");
    for (var i = 0; i < party.values.length; i++) {
      print("${i + 1}. ${party.values[i].name.toUpperCase()}");
    }

    var partyInput = stdin.readLineSync();
    int? selectedPartyIndex = int.tryParse(partyInput ?? '');
    if (selectedPartyIndex == null || selectedPartyIndex < 1 || selectedPartyIndex > party.values.length) {
      print("Invalid selection. Please try again.");
      return;
    }

    candidate[index]["party"] = party.values[selectedPartyIndex - 1];
    print("Candidate party updated successfully.");
  } else {
    print("Invalid choice. Update canceled.");
  }
}
deleteCanidate() {
  for (var i = 0; i < candidate.length; i++) {
    print("Index: $i and Name is ${candidate[i]}");
  }
  print("Enter Index to Delete Candidate : ");
  int candidateIndex = int.parse(stdin.readLineSync()!);
  if(candidateIndex < 0 || candidateIndex >= candidate.length){
    print("Invalid index. Please try again.");
    return;
  }else{
  candidate.removeAt(candidateIndex);

  print("$candidateIndex Index Value is Deleted Succesfully");
  print("==================================================");
  }
}
void addPA() {
  print("Please Enter the CNIC Number of Polling Agent without dash: ");
  var cnicInput = stdin.readLineSync();
  if (cnicInput == null || cnicInput.length != 13 || int.tryParse(cnicInput) == null) {
    print("Invalid CNIC number. Please ensure it is 13 digits and numeric.");
    return;
  }

  int cnic = int.parse(cnicInput);
  if (cnicNumb.contains(cnic)) {
    print("CNIC Number already exists. Please try again.");
    return;
  }

  print("Enter Your Username to Add: ");
  var username = stdin.readLineSync();
  print("Enter Your Password: ");
  var password = stdin.readLineSync();

  print("Please select a party:");
  for (var i = 0; i < party.values.length; i++) {
    print("${i + 1}. ${party.values[i].name.toUpperCase()}");
  }

  var partyInput = stdin.readLineSync();
  int? selectedPartyIndex = int.tryParse(partyInput ?? '');
  if (selectedPartyIndex == null || selectedPartyIndex < 1 || selectedPartyIndex > party.values.length) {
    print("Invalid selection. Please try again.");
    return;
  }

  poolingAgent.add({
    "cnic": cnic,
    "username": username,
    "password": password,
    "party": party.values[selectedPartyIndex - 1]
  });
  cnicNumb.add(cnic); // Ensure CNIC is added to the global list.
  print("Polling Agent added successfully!");
}
viewPA() {
  print(poolingAgent);
  print("==================================================");
}


void updatePA() {
  for (var i = 0; i < poolingAgent.length; i++) {
    print("Index: $i and value is ${poolingAgent[i]}");
  }
  print("Please enter the index number to update cnic username ,password and party :");
  int inputPool = int.parse(stdin.readLineSync()!);
  if(inputPool < 0 || inputPool >= poolingAgent.length){
    print("Invalid index. Please try again.");
    return;
  }
  print("What would you like to update?");
  print("1: CNIC");
  print("2: Username");
  print("3: Password");
  print("4: Party");
  
  int fieldChoice = int.parse(stdin.readLineSync()!);

  switch (fieldChoice) {
    case 1:
      print("Please enter the new CNIC: ");
      var newCnicValue = stdin.readLineSync();
      poolingAgent[inputPool]["cnic"] = newCnicValue;
      print("CNIC updated successfully for index $inputPool.");
      break;

    case 2:
      print("Please enter the new username: ");
      var newUserNameValue = stdin.readLineSync();
      poolingAgent[inputPool]["username"] = newUserNameValue;
      print("Username updated successfully for index $inputPool.");
      break;

    case 3:
      print("Please enter the new password: ");
      var newPasswordValue = stdin.readLineSync();
      poolingAgent[inputPool]["password"] = newPasswordValue;
      print("Password updated successfully for index $inputPool.");
      break;

    case 4:
      print("Please select the new party (choose a number):");
      print("1: PTI");
      print("2: PPP");
      print("3: PMLN");
      print("4: MQM");
      print("5: Independent");
      int partyChoice = int.parse(stdin.readLineSync()!);

      party selectedParty;
      switch (partyChoice) {
        case 1:
          selectedParty = party.pti;
          break;
        case 2:
          selectedParty = party.ppp;
          break;
        case 3:
          selectedParty = party.pmln;
          break;
        case 4:
          selectedParty = party.mqm;
          break;
        case 5:
          selectedParty = party.independent;
          break;
        default:
          print("Invalid choice. Setting default party to Independent.");
          selectedParty = party.independent;
      }

      poolingAgent[inputPool]["party"] = selectedParty.toString().split('.').last;
      print("Party updated successfully to ${selectedParty.toString().split('.').last} for index $inputPool.");
      break;

    default:
      print("Invalid choice. No update made.");
      break;
  }

  print("==================================================");
}
deletePA() {
  for (var i = 0; i < poolingAgent.length; i++) {
    print("Index: $i and value is ${poolingAgent[i]}");
  }
  print("please enter index number to delete username and password");
  int inputPool = int.parse(stdin.readLineSync()!);
  if(inputPool < 0 || inputPool >= poolingAgent.length){
    print("Invalid index. Please try again.");
    return;
  }else{
  poolingAgent.removeAt(inputPool);
  print("$inputPool index value Deleted Succesfully");
  print("==================================================");
  }
}

addVoter() {
  print("Enter Cnic Number of Voter without dash:");
  int cnicInputs = int.parse(stdin.readLineSync()!);
 if(cnicInputs.toString().length != 13){
  if(cnicNumb.contains(cnicInputs)){
    print("CNIC Number already exists. Please try again.");
    }else{
  cnicNumb.add(cnicInputs);
  print("$cnicInputs Value is Added Succesfully");
  print("====================================");
  }
  }else{
    print("Invalid CNIC Number. Please try again.");
  }
}

viewVoter() {
  print("List of Voters.");
  print(cnicNumb);
  print("==================================================");
}

updateVoter() {
  for (var i = 0; i < cnicNumb.length; i++) {
    print("Index: ${i} Value: ${cnicNumb[i]}");
  }
  print("Enter Index Number for update.");
  int indexNumb = int.parse(stdin.readLineSync()!);
  if(indexNumb < 0 || indexNumb >= cnicNumb.length){
    print("Invalid index. Please try again.");
    return;
  }
  print("Enter Updated Cnic Number to $indexNumb index number");
  var updatedCnic = stdin.readLineSync();

  cnicNumb[indexNumb] = updatedCnic;
  print("$indexNumb Index Value is Updated Succesfully");
  print("=============================================");
}

deleteVoter() {
  for (var i = 0; i < cnicNumb.length; i++) {
    print("Index: ${i} Value: ${cnicNumb[i]}");
  }
  print("Enter Index Number To Delete Value: ");
  int indexNumb = int.parse(stdin.readLineSync()!);
  if(indexNumb < 0 || indexNumb >= cnicNumb.length){
    print("Invalid index. Please try again.");
    return;
  }else{
  cnicNumb.removeAt(indexNumb);
  print("$indexNumb Index Value is Deleted Succesfully");
  print("============================================");
  }
}

pollingAgentFunctions() {
  stdout.write("Enter Username: ");
  var inputUser = stdin.readLineSync();
  stdout.write("Enter Password: ");
  var inputPass = stdin.readLineSync();
  
  // Check login credentials
  var authenticatedAgent = poolingAgent.firstWhere(
    (pa) => pa["username"] == inputUser && pa["password"] == inputPass,
    orElse: () => null,
  );

  if (authenticatedAgent != null) {
    isLoginPA = true;
    var party = authenticatedAgent["party"];
    switch (party) {
      case "pti":
        totalVoters = ptiVoter;
        break;
      case "ppp":
        totalVoters = pppVoter;
        break;
      case "pmln":
        totalVoters = pmlnVoter;
        break;
      case "mqm":
        totalVoters = mqmVoter;
        break;
      case "independent":
        totalVoters = independentVoter;
        break;
      default:
        totalVoters = [];
    }

    print("============ Login Successful ============");
    print("Welcome, Polling Agent for $party!");

    // Polling Agent Menu
    while (isLoginPA) {
      print("\nPolling Agent Menu:");
      print("1. View total votes gained by your party.");
      print("2. Log out.");
      print("=========================================");

      var agentInput = stdin.readLineSync();
      if (agentInput == "1") {
        print("Total Votes for $party: ${totalVoters.length}");
      } else if (agentInput == "2") {
        isLoginPA = false;
        print("You have been logged out successfully.");
      } else {
        print("Invalid option. Please try again.");
      }
    }
  } else {
    print("Invalid credentials. Please try again.");
  }
}
VoterFunctions() {
  stdout.write("Enter your CNIC Number: ");
  int cnic = int.parse(stdin.readLineSync()!);
  
  if (cnicNumb.contains(cnic)) {
    if (ptiVoter.contains(cnic) || pppVoter.contains(cnic) || pmlnVoter.contains(cnic) || mqmVoter.contains(cnic) || independentVoter.contains(cnic)) {
      print("You have already voted!");
    } else {
      print("Vote for a Party:");
      print("1. PTI");
      print("2. PPP");
      print("3. PML-N");
      print("4. MQM");
      print("5. Independent");
      var voteInput = stdin.readLineSync();
      
      if (voteInput == "1") {
        ptiVoter.add(cnic);
        print("Your vote for PTI has been cast successfully.");
      } else if (voteInput == "2") {
        pppVoter.add(cnic);
        print("Your vote for PPP has been cast successfully.");
      } else if (voteInput == "3") {
        pmlnVoter.add(cnic);
        print("Your vote for PML-N has been cast successfully.");
      } else if (voteInput == "4") {
        mqmVoter.add(cnic);
        print("Your vote for MQM has been cast successfully.");
      } else if (voteInput == "5") {
        independentVoter.add(cnic);
        print("Your vote for Independent has been cast successfully.");
      } else {
        print("Invalid Input. Vote not cast.");
      }
    }
  } else {
    print("CNIC not found in the Voter List. Please register first.");
  }
}partyVotes() {
  print("Your Party Total Votes: ");
  if (totalVoters == ptiVoter) {
    print(ptiVoter.length);
  } else if (totalVoters == pppVoter) {
    print(pppVoter.length);
  } else if (totalVoters == pmlnVoter) {
    print(pmlnVoter.length);
  }
  print("==================================================");
}

totalVotes() {
  print("Total votes of all party.");

  int list1Length = ptiVoter.length;
  int list2Length = pppVoter.length;
  int list3Length = pmlnVoter.length;
  int list4Length = mqmVoter.length;
  int list5Length = independentVoter.length;

  List<int> mergedList = [];
  mergedList = [
    ...ptiVoter,
    ...pppVoter,
    ...pmlnVoter,
    ...mqmVoter,
    ...independentVoter
  ];

  // Print the length of each list and the merged list.
  print("The Voter of PTI is ${list1Length}.");
  print("The Voter of PPP is ${list2Length}.");
  print("The Voter of PMLN is ${list3Length}.");
  print("The Voter of MQM is ${list4Length}.");
  print("The Voter of INDEPENDENT is ${list5Length}.");
  print("The Total Voter of ALL Party is ${mergedList.length}.");

  print("==================================================");
}

highestvotes() {
  int max = findMaxListLength(
      [ptiVoter, pmlnVoter, pppVoter, mqmVoter, independentVoter]);
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
