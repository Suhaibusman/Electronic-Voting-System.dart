import sys

class Party:
    PTI = "pti"
    PPP = "ppp"
    PMLN = "pmln"
    MQM = "mqm"
    INDEPENDENT = "independent"

is_voter = True
total_voters = []
candidates = [
    {"name": "Imran Khan", "party": Party.PTI},
    {"name": "Bilawal Bhutto", "party": Party.PPP},
    {"name": "Nawaz Sharif", "party": Party.PMLN},
    {"name": "Altaf Hussain", "party": Party.MQM},
    {"name": "Independent", "party": Party.INDEPENDENT},
]
polling_agents = [
    {"cnic": 4220111569725, "username": "suhaib", "password": "suhaib", "party": Party.MQM},
    {"cnic": 4220111569726, "username": "sumair", "password": "sumair", "party": Party.PTI},
    {"cnic": 4220111569727, "username": "asim", "password": "asim", "party": Party.PTI},
    {"cnic": 4220111569728, "username": "arqum", "password": "arqum", "party": Party.PMLN},
]
# cnic_numbers = [4220111569725, 4220111569725, 4220111569725]
pti_voters = [422014, 42301]
pmln_voters = []
ppp_voters = [1, 3, 23, 4, 2, 32]
mqm_voters = []
independent_voters = []
is_login_cec = False
is_running = True
cec_candidate_window = False
cec_pa_window = False
cec_voter_window = False
is_login_pa = False

def main():
    run()

def run():
    global is_running
    while is_running:
        print("============ ELECTRONIC VOTING SYSTEM ============")
        print("Login as Chief Election Commission. Press 1")
        print("Login as a Polling Agent. Press 2")
        print("To cast your vote. Press 3")
        print("Press Any Key to Stop Program")

        input1 = input()
        if input1 == "1":
            cec_functions()
        elif input1 == "2":
            polling_agent_functions()
        elif input1 == "3":
            voter_functions()
        else:
            print("============ Program Ended! ============")
            sys.exit(0)
def polling_agent_functions():
    print("============ Polling Agent Login ============")
    input_user = input("Enter Username: ")
    input_pass = input("Enter Password: ")

    # Check login credentials
    authenticated_agent = next(
        (pa for pa in polling_agents if pa["username"] == input_user and pa["password"] == input_pass),
        None
    )

    if authenticated_agent:
        global is_login_pa, total_voters
        is_login_pa = True
        party = authenticated_agent["party"]
        if party == "pti":
            total_voters = pti_voters
        elif party == "ppp":
            total_voters = ppp_voters
        elif party == "pmln":
            total_voters = pmln_voters
        elif party == "mqm":
            total_voters = mqm_voters
        elif party == "independent":
            total_voters = independent_voters
        else:
            total_voters = []

        print("============ Login Successful ============")
        print(f"Welcome, Polling Agent for {party}!")

        # Polling Agent Menu
        while is_login_pa:
            print("\nPolling Agent Menu:")
            print("1. View total votes gained by your party.")
            print("2. Log out.")
            print("=========================================")

            agent_input = input("Enter your choice: ")
            if agent_input == "1":
                print(f"Total Votes for {party}: {len(total_voters)}")
            elif agent_input == "2":
                is_login_pa = False
                print("You have been logged out successfully.")
            else:
                print("Invalid option. Please try again.")
    else:
        print("Invalid credentials. Please try again.")


def voter_functions():
    print("============ Voter Login ============")
    try:
        cnic = int(input("Enter your CNIC Number: "))
        
        # Check if the CNIC exists in the voter list (by comparing with 'cnic' key in dictionaries)
        if any(voter['cnic'] == cnic for voter in voters):
            if any(cnic in voter_list for voter_list in [pti_voters, ppp_voters, pmln_voters, mqm_voters, independent_voters]):
                print("You have already voted!")
            else:
                print("Vote for a Party:")
                print("1. PTI")
                print("2. PPP")
                print("3. PML-N")
                print("4. MQM")
                print("5. Independent")
                vote_input = input("Enter your choice: ")

                if vote_input == "1":
                    pti_voters.append(cnic)
                    print("Your vote for PTI has been cast successfully.")
                elif vote_input == "2":
                    ppp_voters.append(cnic)
                    print("Your vote for PPP has been cast successfully.")
                elif vote_input == "3":
                    pmln_voters.append(cnic)
                    print("Your vote for PML-N has been cast successfully.")
                elif vote_input == "4":
                    mqm_voters.append(cnic)
                    print("Your vote for MQM has been cast successfully.")
                elif vote_input == "5":
                    independent_voters.append(cnic)
                    print("Your vote for Independent has been cast successfully.")
                else:
                    print("Invalid Input. Vote not cast.")
        else:
            print("CNIC not found in the Voter List. Please register first.")
    except ValueError:
        print("Invalid CNIC. Please enter a valid number.")
def cec_functions():
    global is_login_cec, cec_candidate_window, cec_pa_window, cec_voter_window
    username = input("Enter Username: ")
    password = input("Enter Password: ")
    if username == "admin" and password == "admin":
        is_login_cec = True
        print("============ Login Successful ============")

        while is_login_cec:
            print("Press 1 for Candidates Menu.")
            print("Press 2 for Polling Agents Menu.")
            print("Press 3 for Voters Menu.")
            print("Press Any Key to Main Menu.")
            cec_input = input()

            if cec_input == "1":
                cec_candidate_window = True
                while cec_candidate_window:
                    print("Press 1 to add a Candidate.")
                    print("Press 2 to check Candidate List.")
                    print("Press 3 to update Candidate Details.")
                    print("Press 4 to delete Candidate Details.")
                    print("Press 0 to back to the previous Window.")

                    candidate_input = input()
                    if candidate_input == "1":
                        add_candidate()
                    elif candidate_input == "2":
                        view_candidates()
                    elif candidate_input == "3":
                        update_candidate()
                    elif candidate_input == "4":
                        delete_candidate()
                    else:
                        cec_candidate_window = False
            elif cec_input == "2":
                cec_pa_window = True
                while cec_pa_window:
                    print("Press 1 to add a Polling Agent.")
                    print("Press 2 to check Polling Agent List.")
                    print("Press 3 to update Polling Agent Details.")
                    print("Press 4 to delete Polling Agent Details.")
                    print("Press 0 to back to the previous Window.")

                    pa_input = input()
                    if pa_input == "1":
                        add_polling_agent()
                    elif pa_input == "2":
                        view_polling_agents()
                    elif pa_input == "3":
                        update_polling_agent()
                    elif pa_input == "4":
                        delete_polling_agent()
                    else:
                        cec_pa_window = False
            elif cec_input == "3":
                cec_voter_window = True
                while cec_voter_window:
                    print("Press 1 to add Voter Details.")
                    print("Press 2 to check Voter List.")
                    print("Press 3 to update Voter Details.")
                    print("Press 4 to delete Voter Details.")
                    print("Press 0 to back to the previous Window.")

                    voter_input = input()
                    if voter_input == "1":
                        add_voter()
                    elif voter_input == "2":
                        view_voters()
                    elif voter_input == "3":
                        update_voter()
                    elif voter_input == "4":
                        delete_voter()
                    else:
                        cec_voter_window = False
            else:
                print("Logout Successfully.")
                is_login_cec = False
    else:
        print("Invalid Credentials. Please try again.")

def add_candidate():
    name = input("Enter a Candidate name: ")
    print(f"Please select a party for {name}:")
    parties = [Party.PTI, Party.PPP, Party.PMLN, Party.MQM, Party.INDEPENDENT]
    for idx, party in enumerate(parties, start=1):
        print(f"{idx}. {party.upper()}")

    try:
        party_choice = int(input())
        selected_party = parties[party_choice - 1]
    except (ValueError, IndexError):
        print("Invalid selection. Please try again.")
        return

    candidates.append({"name": name, "party": selected_party})
    print(f"{name} is Added Successfully.")

def view_candidates():
    print("Candidates List:")
    for candidate in candidates:
        print(candidate)

def update_candidate():
    print("Update Candidate Details:")
    for idx, candidate in enumerate(candidates, start=1):
        print(f"{idx}. {candidate['name']} ({candidate['party']})")

    try:
        choice = int(input("Select the candidate to update (by number): "))
        if 1 <= choice <= len(candidates):
            selected_candidate = candidates[choice - 1]
            new_name = input(f"Enter new name for {selected_candidate['name']} (leave blank to keep unchanged): ")
            print("Please select a new party:")
            parties = [Party.PTI, Party.PPP, Party.PMLN, Party.MQM, Party.INDEPENDENT]
            for idx, party in enumerate(parties, start=1):
                print(f"{idx}. {party.upper()}")

            try:
                party_choice = int(input())
                selected_party = parties[party_choice - 1]
            except (ValueError, IndexError):
                print("Invalid selection. Keeping the old party.")
                selected_party = selected_candidate['party']

            if new_name:
                selected_candidate['name'] = new_name
            selected_candidate['party'] = selected_party
            print("Candidate details updated successfully.")
        else:
            print("Invalid selection. Please try again.")
    except ValueError:
        print("Invalid input. Please try again.")

def delete_candidate():
    print("Delete Candidate:")
    for idx, candidate in enumerate(candidates, start=1):
        print(f"{idx}. {candidate['name']} ({candidate['party']})")

    try:
        choice = int(input("Select the candidate to delete (by number): "))
        if 1 <= choice <= len(candidates):
            removed_candidate = candidates.pop(choice - 1)
            print(f"{removed_candidate['name']} has been removed.")
        else:
            print("Invalid selection. Please try again.")
    except ValueError:
        print("Invalid input. Please try again.")

def add_polling_agent():
    try:
        cnic = int(input("Enter CNIC for the polling agent: "))
        username = input("Enter username for the polling agent: ")
        password = input("Enter password for the polling agent: ")
        print("Please select a party for the polling agent:")
        parties = [Party.PTI, Party.PPP, Party.PMLN, Party.MQM, Party.INDEPENDENT]
        for idx, party in enumerate(parties, start=1):
            print(f"{idx}. {party.upper()}")

        try:
            party_choice = int(input())
            selected_party = parties[party_choice - 1]
        except (ValueError, IndexError):
            print("Invalid selection. Please try again.")
            return

        polling_agents.append({
            "cnic": cnic,
            "username": username,
            "password": password,
            "party": selected_party
        })
        print("Polling agent added successfully.")
    except ValueError:
        print("Invalid CNIC. Please try again.")

def view_polling_agents():
    print("Polling Agents List:")
    for agent in polling_agents:
        print(f"CNIC: {agent['cnic']}, Username: {agent['username']}, Party: {agent['party']}")

def update_polling_agent():
    print("Update Polling Agent Details:")
    for idx, agent in enumerate(polling_agents, start=1):
        print(f"{idx}. {agent['username']} (CNIC: {agent['cnic']}, Party: {agent['party']})")

    try:
        choice = int(input("Select the polling agent to update (by number): "))
        if 1 <= choice <= len(polling_agents):
            selected_agent = polling_agents[choice - 1]
            new_username = input(f"Enter new username for {selected_agent['username']} (leave blank to keep unchanged): ")
            new_password = input(f"Enter new password (leave blank to keep unchanged): ")
            print("Please select a new party:")
            parties = [Party.PTI, Party.PPP, Party.PMLN, Party.MQM, Party.INDEPENDENT]
            for idx, party in enumerate(parties, start=1):
                print(f"{idx}. {party.upper()}")

            try:
                party_choice = int(input())
                selected_party = parties[party_choice - 1]
            except (ValueError, IndexError):
                print("Invalid selection. Keeping the old party.")
                selected_party = selected_agent['party']

            if new_username:
                selected_agent['username'] = new_username
            if new_password:
                selected_agent['password'] = new_password
            selected_agent['party'] = selected_party
            print("Polling agent details updated successfully.")
        else:
            print("Invalid selection. Please try again.")
    except ValueError:
        print("Invalid input. Please try again.")

def delete_polling_agent():
    print("Delete Polling Agent:")
    for idx, agent in enumerate(polling_agents, start=1):
        print(f"{idx}. {agent['username']} (CNIC: {agent['cnic']}, Party: {agent['party']})")

    try:
        choice = int(input("Select the polling agent to delete (by number): "))
        if 1 <= choice <= len(polling_agents):
            removed_agent = polling_agents.pop(choice - 1)
            print(f"{removed_agent['username']} has been removed.")
        else:
            print("Invalid selection. Please try again.")
    except ValueError:
        print("Invalid input. Please try again.")

# List to store voter details
voters = [{'cnic': 42201, 'name': 'suhaib', 'age': 22, 'address': 'malir', 'polling_station': 'malir'}]  # Format: [{"cnic": int, "name": str, "age": int, "address": str, "polling_station": str}]

def add_voter():
    try:
        cnic = int(input("Enter CNIC for the voter: "))
        name = input("Enter name of the voter: ")
        age = int(input("Enter age of the voter: "))
        address = input("Enter address of the voter: ")
        polling_station = input("Enter polling station for the voter: ")

        voters.append({
            "cnic": cnic,
            "name": name,
            "age": age,
            "address": address,
            "polling_station": polling_station
        })
        print("Voter added successfully.")
    except ValueError:
        print("Invalid input. Please ensure CNIC and age are numeric values.")

def view_voters():
    print("List of Registered Voters:")
    if not voters:
        print("No voters registered yet.")
        return

    for idx, voter in enumerate(voters, start=1):
        print(f"{idx}. CNIC: {voter['cnic']}, Name: {voter['name']}, Age: {voter['age']}, "
              f"Address: {voter['address']}, Polling Station: {voter['polling_station']}")

def update_voter():
    print("Update Voter Details:")
    if not voters:
        print("No voters to update.")
        return

    for idx, voter in enumerate(voters, start=1):
        print(f"{idx}. {voter['name']} (CNIC: {voter['cnic']}, Polling Station: {voter['polling_station']})")

    try:
        choice = int(input("Select the voter to update (by number): "))
        if 1 <= choice <= len(voters):
            selected_voter = voters[choice - 1]
            new_name = input(f"Enter new name for {selected_voter['name']} (leave blank to keep unchanged): ")
            try:
                new_age = input(f"Enter new age for {selected_voter['name']} (leave blank to keep unchanged): ")
                new_age = int(new_age) if new_age else selected_voter['age']
            except ValueError:
                print("Invalid input for age. Keeping old value.")
                new_age = selected_voter['age']

            new_address = input(f"Enter new address (leave blank to keep unchanged): ")
            new_polling_station = input(f"Enter new polling station (leave blank to keep unchanged): ")

            if new_name:
                selected_voter['name'] = new_name
            selected_voter['age'] = new_age
            if new_address:
                selected_voter['address'] = new_address
            if new_polling_station:
                selected_voter['polling_station'] = new_polling_station

            print("Voter details updated successfully.")
        else:
            print("Invalid selection. Please try again.")
    except ValueError:
        print("Invalid input. Please try again.")

def delete_voter():
    print("Delete Voter:")
    if not voters:
        print("No voters to delete.")
        return

    for idx, voter in enumerate(voters, start=1):
        print(f"{idx}. {voter['name']} (CNIC: {voter['cnic']})")

    try:
        choice = int(input("Select the voter to delete (by number): "))
        if 1 <= choice <= len(voters):
            removed_voter = voters.pop(choice - 1)
            print(f"{removed_voter['name']} has been removed.")
        else:
            print("Invalid selection. Please try again.")
    except ValueError:
        print("Invalid input. Please try again.")

if __name__ == "__main__":
    main()
