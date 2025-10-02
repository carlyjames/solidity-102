// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Twitter {
    uint MAXTWEET = 280;
    address public owner;
    
    constructor(){
        owner = msg.sender;
    }
    
    struct Tweet {
        address author;
        string tweet;
        uint256 timestamp;
        uint256 likes;
        uint256 id;
    }
    
    modifier onlyOwner(){
        require(msg.sender == owner, "only the owner can perform this action");
        _;
    }
    
    function CheckOwner() public view returns(address) {
        return owner;
    }
    
    mapping(address => Tweet[]) public tweets;
    
    // events
    event TweetCreated(uint256 id, address author, string tweet, uint256 timestamp);
    event LikeTweet(address liker, address tweetAuthor, uint256 tweetId, uint256 newLikeCount);
    event UnlikeTweet(address unliker, address tweetAuthor, uint256 tweetId, uint256 newLikeCount);
    
    function changeTweetLength(uint256 tweetlength) public onlyOwner {
        MAXTWEET = tweetlength;
    }
    
    function createTweet(string memory _tweet) public {
        require(bytes(_tweet).length > 0, "cannot pass empty tweet");
        require(bytes(_tweet).length <= MAXTWEET, "tweet too long");
        
        Tweet memory newTweet = Tweet({
            id: tweets[msg.sender].length,
            author: msg.sender,
            tweet: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });
        
        tweets[msg.sender].push(newTweet);
        emit TweetCreated(newTweet.id, newTweet.author, newTweet.tweet, newTweet.timestamp);
    }
    
    function likeTweet(uint id, address author) external {
        require(tweets[author][id].id == id, "tweet does not exist");
        tweets[author][id].likes++;
        emit LikeTweet(msg.sender, author, id, tweets[author][id].likes);
    }
    
    function unlikeTweet(uint id, address author) external {
        require(tweets[author][id].id == id, "tweet does not exist");
        require(tweets[author][id].likes > 0, "tweet does not have any likes");
        tweets[author][id].likes--;
        emit UnlikeTweet(msg.sender, author, id, tweets[author][id].likes);
    }
    
    function getTweetLength() public view returns(uint){
        return MAXTWEET;
    }
    
    // function to get a single tweet in an array
    function getSingleTweet(uint _i) public view returns (Tweet memory){
        return tweets[msg.sender][_i];
    }
    
    // function to get all tweets in an array
    function getAllTweets(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }

    // function to get total likes
    function getAllLikes(address _author) external view returns(uint){
        uint totalLikes;

        for (uint i = 0; i < tweets[_author].length; i++) {
            totalLikes += tweets[_author][i].likes;
        }
        return totalLikes;
    }
}