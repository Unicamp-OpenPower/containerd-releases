import requests
# find and save the current Github release
html = str(
    requests.get('https://github.com/containerd/containerd/releases/latest')
    .content)
index = html.find('containerd ')
github_version = html[index + 11:index + 17]
file = open('github_version.txt', 'w')
file.writelines(github_version)
file.close()

# find and save the current Bazel version on FTP server
html = str(
    requests.get(
        'https://oplab9.parqtec.unicamp.br/pub/ppc64el/containerd/latest'
    ).content)
index = html.rfind('containerd-')
ftp_version = html[index + 11:index + 17]
file = open('ftp_version.txt', 'w')
file.writelines(ftp_version)
file.close()

# find and save the oldest Bazel version on FTP server
index = html.find('containerd-')
delete = html[index + 11:index + 17]
file = open('delete_version.txt', 'w')
file.writelines(delete)
file.close()
