import os
import re

def main():
    if not os.path.isfile('/etc/docker/daemon.json'):
        f = open('/etc/docker/daemon.json', 'w+')
        f.write('{"experimental" : true}')
        f.close()
    else:
        f = open('/etc/docker/daemon.json', 'r')
        content = []
        exp_exists = 0
        for i, line in enumerate(f):
            l = line.strip()
            if re.findall('experimental',l):
                exp_exists = i
            content.append(l)
        f.close()

        if not content:
            content = ['{"experimental":true}']
        
        else:
            if not exp_exists:
                content.insert(1, '"experimental":true,')
            else:
                content[i] = '"experimental" :true,'
        
        content = '\n'.join(content)
        f = open('/etc/docker/daemon.json','w')
        f.writelines(content)
        f.close

if __name__ == "__main__":
    main()
