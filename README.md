# Supplementary material for the paper: "Evaluating Negation with Multi-way Joins Accelerates Class Expression Learning"

# Experiments (Ansible playbook)
To set up the experiments, we provide an Ansible playbook.

Installation: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

Ansible 2.16.4 is used for these experiments.

## Before running the playbook
 - Replace ```<ip_of_host>``` in ```ansible_playbook/inventory.yaml``` with the IP of the managed node (i.e., the server that will run the experiments).
 - Replace ```<target_dir>``` in ```ansible_playbook/roles/base/defaults/main.yaml``` with the absolute path to the directory of the managed node that will store the experiments' required files.
 - Replace ```<user>``` in ```ansible_playbook/roles/base/defaults/main.yaml``` with the username that will be used to login with to the managed node.
 - Replace ```<ansible-temp-directory>``` in ```ansible_playbook/ansible.cfg``` with the absolute path to the directory that will be used as a temporary directory for ansible.
 - Download the free version of GraphDB 10.3.3 and add it to `ansible_playbook/roles/graphdb/files`.

## Playbook Execution
You can execute the playbook by issuing the following command within the `ansible_playbook` directory:

    ansible-playbook -kKi inventory.yaml playbook.yaml

## Benchmark Execution
Before running the benchmarks:

- Make the Tentris binary an executable

        chmod +x ./systems/tentris/v0.5.4+tentris.v6.1.2/tentris

- Increase the ulimit
    
        ulimit -n 64000
    
- Prepare the databases
       
        cd <target_dir>
        sudo ./run-loaders.sh

To run the comparison of the different graph storage solutions on the datasets for class expression learning, execute the script ```run-sparql-cel.sh``` with root privileges.

    cd <target_dir>
    sudo ./run-sparql-cel.sh

To run the comparison of the different graph storage solutions on YAGO4English, execute the script ```run-sparql-yago.sh``` with root privileges.

    cd <target_dir>
    sudo ./run-sparql-yago.sh

The results  of the benchmark (IGUANA result files, one per system) are stored in the directory `<target_dir>/iguana_results/sparql`

## Datataset and Query Prepartion
The code that was used to generate class expressions/queries and prepare the datasets is available [here](https://files.dice-research.org/projects/tentris-alc2sparql/ecml-helper-code).

## Datasets and Queries
The datasets and the queries used in the experimental results are available in the following links:
- [Carcinogenesis](https://files.dice-research.org/projects/tentris-alc2sparql/carcinogenesis.zip)
- [Mutagenesis](https://files.dice-research.org/projects/tentris-alc2sparql/mutagenesis.zip)
- [Premier League](https://files.dice-research.org/projects/tentris-alc2sparql/premierleague.zip)
- [Vicodi](https://files.dice-research.org/projects/tentris-alc2sparql/vicodi.zip)
- [YAGO4English](https://files.dice-research.org/projects/tentris-alc2sparql/yago4english.zip)

## Results
The results reported in the paper can be downlowded from this [link](https://files.dice-research.org/projects/tentris-alc2sparql/ecml-results.zip).

## Pre-Built Binary
We provide a pre-built binary of our implementation (available at the directory `ansible_playbook/roles/tentris/files`). The binary is not to be redistributed or used for any other purpose (commercial or non-commercial) other than reproducing the results reported in the paper.
