import json
from json.decoder import JSONDecodeError

def main():
    path = "/home/mehran/jsontest.json"
    # with open("/etc/docker/daemon.json", "r+") as json_file:
    with open(path, "r") as json_file:
        try:
            json_data = json.loads(json_file.read())
            json_data.update({"experimental":True})
        except JSONDecodeError:
            json_data = {"experimental":True}

    with open(path, "w") as json_file:
        json.dump(json_data, json_file, sort_keys=True)

if __name__ == "__main__":
    main()
