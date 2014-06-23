using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Registrant
{
    private int registrantID;
    private string firstName;
    private string lastName;
    private string midInitial;
    private string gender;
    private string dob;
    private int heightIn;
    private int heightFt;
    private int weight;
    private string hairColor;
    private string eyeColor;
    private string race;
    private string complexion;
    private string build;
    private string phone1;
    private string phone2;
    private string email;
    private string disability;
    private string verbalAbility;
    private string medConditions;
    private string medications;
    private string safetyConcerns;
    private string characteristics;
    private string clothing;
    private string hobbies;
    private string fascinations;
    private string freqLocations;
    private string misc;
    private int active;
    
    public Registrant() {}

    public int RegistrationID
    {
        get
        {
            return registrantID;
        }
        set
        {
            registrantID = value;
        }
    }

    public string FirstName
    {
        get
        {
            return firstName;
        }
        set
        {
            firstName = value;
        }

    }

    public string LastName
    {
        get
        {
            return lastName;
        }
        set
        {
            lastName = value;
        }
    }

    public string MidInitial
    {
        get
        {
            return midInitial;
        }
        set
        {
            midInitial = value;
        }
    }

    public string Gender
    {
        get
        {
            return gender;
        }
        set
        {
            gender = value;
        }
    }

    public string DoB
    {
        get
        {
            return dob;
        }
        set
        {
            dob = value;
        }
    }

    public int HeightIn
    {
        get
        {
            return heightIn;
        }
        set
        {
            heightIn = value;
        }
    }

    public int HeightFt
    {
        get
        {
            return heightFt;
        }
        set
        {
            heightFt = value;
        }
    }

    public int Weight
    {
        get
        {
            return weight;
        }
        set
        {
            weight = value;
        }
    }

    public string HairColor
    {
        get
        {
            return hairColor;
        }
        set
        {
            hairColor = value;
        }
    }

    public string EyeColor
    {
        get
        {
            return eyeColor;
        }
        set
        {
            eyeColor = value;
        }
    }

    public string Race
    {
        get
        {
            return race;
        }
        set
        {
            race = value;
        }
    }

    public string Complexion
    {
        get
        {
            return complexion;
        }
        set
        {
            complexion = value;
        }
    }

    public string Build
    {
        get
        {
            return build;
        }
        set
        {
            build = value;
        }
    }

    public string Phone1
    {
        get
        {
            return phone1;
        }
        set
        {
            phone1 = value;
        }
    }

    public string Phone2
    {
        get
        {
            return phone2;
        }
        set
        {
            phone2 = value;
        }
    }

    public string Email
    {
        get
        {
            return email;
        }
        set
        {
            email = value;
        }
    }

    public string Disability
    {
        get
        {
            return disability;
        }
        set
        {
            disability = value;
        }
    }

    public string VerbalAbility
    {
        get
        {
            return verbalAbility;
        }
        set
        {
            verbalAbility = value;
        }
    }

    public string MedConditions
    {
        get
        {
            return medConditions;
        }
        set
        {
            medConditions = value;
        }
    }

    public string Medications
    {
        get
        {
            return medications;
        }
        set
        {
            medications = value;
        }
    }

    public string Characteristics
    {
        get
        {
            return characteristics;
        }
        set
        {
            characteristics = value;
        }
    }

    public string SafetyConcerns
    {
        get
        {
            return safetyConcerns;
        }
        set
        {
            safetyConcerns = value;
        }
    }

    public string Clothing
    {
        get
        {
            return clothing;
        }
        set
        {
            clothing = value;
        }
    }

    public string Hobbies
    {
        get
        {
            return hobbies;
        }
        set
        {
            hobbies = value;
        }
    }

    public string Fascinations
    {
        get
        {
            return fascinations;
        }
        set
        {
            fascinations = value;
        }
    }

    public string FreqLocations
    {
        get
        {
            return freqLocations;
        }
        set
        {
            freqLocations = value;
        }
    }

    public string Misc
    {
        get
        {
            return misc;
        }
        set
        {
            misc = value;
        }
    }

    public int Active
    {
        get
        {
            return active;
        }
        set
        {
            active = value;
        }
    }
}