
EBLUE='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${EBLUE}
 ______  __          __  __  __              _              
|  ____|/ _|        / _||  \/  |            | |             
| |__  | |_  _   _ | |_ | \  / |  __ _  ___ | |_  ___  _ __ 
|  __| |  _|| | | ||  _|| |\/| | / _\` |/ __|| __|/ _ \| '__|
| |    | |  | |_| || |  | |  | || (_| |\__ \| |_|  __/| |   
|_|    |_|   \__,_||_|  |_|  |_| \__,_||___/ \__|\___||_| 
 
                                                            
${NC}"


function help() {
  echo "Usage: $0 -u <URL> [-@ <FFUF_OPTION>]"
  echo "Options:"
  echo "  -u <URL>    The target URL to fuzz (must start with http:// or https://)"
  echo "  -@ <FFUF_OPTION>    Pass an additional option to ffuf command"
  echo "  -h          Display this help message"
  exit 0
}


if [[ ! "$*" =~ -u\  ]]; then
  echo -e "${YELLOW}Error: -u argument is required. Run the script like this:${NC}"
  help
fi


while getopts "u:@:h" opt; do
  case $opt in
    u)
      url="$OPTARG"
      ;;
    @)
      ffuf_option="$OPTARG"
      ;;
    h)
      help
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done


if [[ ! "$url" =~ ^(https?://).* ]]; then
  echo -e "${YELLOW}Error: Invalid URL. The URL must start with http:// or https://.${NC}"
  help
fi


path=$(pwd)


cd "$path/wordlists"
files=$(ls -1)


count=0


for file in $files; do
  # Check if the file is a text file
  if [[ "$file" == *.txt ]]; then
    # Check if the first character of each line is "/"
    if grep -q "^/" "$file"; then
      # Run ffuf with the appropriate options
      if [ -n "$ffuf_option" ]; then
        ffuf -u "$url""FUZZ" -s -w "$path/wordlists/$file" $ffuf_option
      else
        ffuf -u "$url/FUZZ" -s -w "$path/wordlists/$file"
      fi
    fi
    # Increment the file counter
    ((count++))
  fi
done
echo -e "${YELLOW}$count wordlist(s) done${NC}"
