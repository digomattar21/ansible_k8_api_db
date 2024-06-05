import sys, json, subprocess

def run_playbook(playbook_path):
    try:
        with subprocess.Popen(['ansible-playbook', playbook_path], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True) as proc:
            for line in proc.stdout:
                print(line, end='') 

            proc.wait()

            if proc.returncode != 0:
                print("ERROR:", proc.stderr.read())

    except Exception as e:
        print(f"An unexpected error occurred while running the playbook {playbook_path}: {e}")
        sys.exit(1)
    


if __name__ == "__main__":
    playbook1 = "ansible_collect.yaml"
    playbook2 = "ansible_minikube_deploy.yaml"
    
    #executar o script de instalacao na maquina da cleanroom
    
    
    run_playbook(playbook1)
    
    #gather data from /data directory and grab the info 
    #analyze runbook and docker apps to be deployed
    # pdf_path = "./data/runbook_example.pdf"  
    # resources_to_be_recovered = read_pdf(pdf_path, "RECURSO A SER RECUPERADO")
    # available_resources_file = open("./utils/available_resources.json")
    # available_resources = json.load(available_resources_file)
    # recover_resources = []
    
    # for i in range(len(resources_to_be_recovered)):
    #     if resources_to_be_recovered[i-1].lower() in available_resources[i-1].get("name").lower():
    #         recover_resources.append(resources_to_be_recovered)
    
    #seria bom encontrarmos a pasta de dockerfile do banco ou pelo menos o tipo e versao do banco a ser recuperado, isso eh restruturacao do playbook
    # print(recover_resources)
    
    
    run_playbook(playbook2)
