// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract fund33 {
    // Struct for Campaign
    struct Campaign {
        address owner;
        string title;
        string description;
        uint256 target;
        uint256 amountCollected;
        uint256 deadline;
        string image;
        address[] donators;
        uint256[] donations;
    }

    mapping(uint256 => Campaign) public campaigns;

    // Initialize the Number of Campaigns
    uint256 public numberOfCampaigns = 0;

    // Function to create a new Campaign
    function createCampaign(
        address _owner,
        string memory _title,
        string memory _description,
        uint256 _target,
        uint256 _deadline,
        string memory _image
    ) public returns (uint256) {
        Campaign storage campaign = campaigns[numberOfCampaigns];

        // Check if everything is OK
        require(
            campaign.deadline < block.timestamp,
            "Deadline is in the past. Expected future timestamp."
        );

        campaign.owner = _owner;
        campaign.title = _title;
        campaign.description = _description;
        campaign.target = _target;
        campaign.amountCollected = 0;
        campaign.deadline = _deadline;
        campaign.image = _image;

        numberOfCampaigns++;

        // Return the index of most recently created campaign
        return numberOfCampaigns - 1;
    }

    // Function to donate to a Campaign
    function donateToCampaign(uint256 _id) public payable {
        uint256 amount = msg.value;

        // Get the Campaign to which we want to donate to
        Campaign storage campaign = campaigns[_id];

        campaign.donators.push(msg.sender);
        campaign.donations.push(amount);

        (bool sent, ) = payable(campaign.owner).call{value: amount}("");

        if (sent) {
            campaign.amountCollected = campaign.amountCollected + amount;
        }
    }

    // Function to get the details of a Campaign
    function getDonators(
        uint256 _id
    ) public view returns (address[] memory, uint256[] memory) {
        return (campaigns[_id].donators, campaigns[_id].donations);
    }

    // Function to get all the Campaigns
    function getCampaigns() public view returns (Campaign[] memory) {
        Campaign[] memory _campaigns = new Campaign[](numberOfCampaigns);

        for (uint256 i = 0; i < numberOfCampaigns; i++) {
            _campaigns[i] = campaigns[i];
        }

        return _campaigns;
    }
}
