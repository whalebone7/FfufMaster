# FfufMaster Usage 

<img width="1280" alt="help" src="https://user-images.githubusercontent.com/125891350/233146162-9563a3d2-06ad-4564-a873-b52bea446d6c.png">

`FfufMaster` allows you to provide a target URL with the `-u` option and run multiple wordlists stored in a folder.It also checks whether the wordlists start with a forward slash `/` or not and writes the `"FUZZ"` keyword properly on the target.

In addition, the tool provides an option `-@` to modify the `FFUF` parameters such as delay or output as per your requirement. This makes the directory brute force process more efficient and effective.

Furthermore, `FfufMaster` is highly customizable as it allows users to add their preferred wordlists to the `wordlists` folder. This feature enables users to tailor the directory brute force process to their specific needs and target audience. By providing this level of flexibility, the tool can enhance the efficiency and effectiveness of the directory brute force process even further.


# FfufMaster Installation 

1. Install FFUF `go install github.com/ffuf/ffuf/v2@latest`
2.  `git clone https://github.com/whalebone7/FfufMaster.git`
3.  `cd FfufMaster && chmod +x FfufMaster.sh `
4.  `./FfufMaster.sh`
<img width="1280" alt="ffuf_master" src="https://user-images.githubusercontent.com/125891350/233148300-9d536926-97f7-43e9-b937-f4f747a1e417.png">
