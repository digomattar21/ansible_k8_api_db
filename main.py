import subprocess
import sys

def run_playbook(playbook_path):
    try:
        # Start the Ansible playbook process
        with subprocess.Popen(['ansible-playbook', playbook_path], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True) as proc:
            # Read output line by line as it becomes available
            for line in proc.stdout:
                print(line, end='')  # Print stdout in real-time

            # Wait for the process to complete
            proc.wait()

            # Check if the process exited with an error
            if proc.returncode != 0:
                # Read and print stderr if there was an error
                print("ERROR:", proc.stderr.read())

    except Exception as e:
        print(f"An unexpected error occurred while running the playbook {playbook_path}: {e}")
        sys.exit(1)

if __name__ == "__main__":
    playbook1 = "ansible_collect.yaml"
    playbook2 = "ansible_minikube_deploy.yaml"
    
    run_playbook(playbook1)
    
    #gather data from /data directory and grab the info 
    #analyze runbook and docker apps to be deployed
    
    
    run_playbook(playbook2)
