using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Formatting
{
	public Formatting() {}

    public static string GetHeightFeet(string heightDB)
    {
        int heightRaw = Convert.ToInt32(heightDB);
        int heightFeet = heightRaw / 12;
        return heightFeet.ToString();
    }

    public static string GetHeightInches(string heightDB)
    {
        int heightRaw = Convert.ToInt32(heightDB);
        int heightInches = heightRaw % 12;
        return heightInches.ToString();
    }

    public static int ConvertHeightToInches(int heightInches, int heightFeet)
    {
        return ((heightFeet * 12) + heightInches);
    }

    public static int GetGenderIndex(string genderDB)
    {
        int genderIndex;
        genderDB = genderDB.Trim();
        switch (genderDB)
        {
            case "Male":
                genderIndex = 1;
                break;
            case "Female":
                genderIndex = 2;
                break;
            case "Transgender":
                genderIndex = 3;
                break;
            default:
                genderIndex = 0;
                break;
        }
        return genderIndex;
    }

	public static string GetGenderValue (int index)
	{
		string genderValue;
		switch (index)
		{
			case 1:
				genderValue = "Male";
				break;
			case 2:
				genderValue = "Female";
				break;
			case 3:
				genderValue = "Transgender";
				break;
			default :
				genderValue = " ";
				break;
		}
		return genderValue;
	}

    public static int GetEyeColorIndex(string eyeColorDB)
    {
        int eyeColorIndex;
        eyeColorDB = eyeColorDB.Trim();
        switch (eyeColorDB)
        {
            case "Blue":
                eyeColorIndex = 1;
                break;
            case "Brown":
                eyeColorIndex = 2;
                break;
			case "Gray":
				eyeColorIndex = 3;
				break;
            case "Green":
                eyeColorIndex = 4;
                break;
            case "Hazel":
                eyeColorIndex = 5;
                break;
            default:
                eyeColorIndex = 0;
                break;
        }
        return eyeColorIndex;
    }

	public static string GetEyeColorValue(int index)
	{
		string eyeColorValue;
		switch (index)
		{
			case 1:
				eyeColorValue = "Blue";
				break;
			case 2:
				eyeColorValue = "Brown";
				break;
			case 3:
				eyeColorValue = "Gray";
				break;
			case 4:
				eyeColorValue = "Green";
				break;
			case 5:
				eyeColorValue = "Hazel";
				break;
			default:
				eyeColorValue = " ";
				break;
		}
		return eyeColorValue;
	}

    public static int GetHairColorIndex(string hairColorDB)
    {
        int hairColorIndex;
        hairColorDB = hairColorDB.Trim();
        switch (hairColorDB)
        {
            case "Bald":
                hairColorIndex = 1;
                break;
            case "Blonde":
                hairColorIndex = 2;
                break;
            case "Black":
                hairColorIndex = 3;
                break;
            case "Brown":
                hairColorIndex = 4;
                break;
            case "Grey":
                hairColorIndex = 5;
                break;
            case "Red":
                hairColorIndex = 6;
                break;
            default:
                hairColorIndex = 0;
                break;
        }
        return hairColorIndex;
    }

	public static string GetHairColorValue(int index)
	{
		string hairColorValue;
		switch(index)
		{
			case 1:
				hairColorValue = "Bald";
				break;
			case 2:
				hairColorValue = "Blonde";
				break;
			case 3:
				hairColorValue = "Black";
				break;
			case 4:
				hairColorValue = "Brown";
				break;
			case 5:
				hairColorValue = "Grey";
				break;
			case 6:
				hairColorValue = "Red";
				break;
			default:
				hairColorValue = " ";
				break;
		}
		return hairColorValue;
	}

    public static int GetRaceIndex(string RaceDB)
    {
        int raceIndex;
        RaceDB = RaceDB.Trim();
        switch (RaceDB)
        {
            case "Asian":
                raceIndex = 1;
                break;
            case "Black":
                raceIndex = 2;
                break;
            case "Hispanic":
                raceIndex = 3;
                break;
            case "Native American":
                raceIndex = 4;
                break;
            case "White":
                raceIndex = 5;
                break;
            default:
                raceIndex = 0;
                break;
        }
        return raceIndex;
    }

	public static string GetRaceValue(int index)
	{
		string raceValue;
		switch (index)
		{
			case 1:
				raceValue = "Asian";
				break;
			case 2:
				raceValue = "Black";
				break;
			case 3:
				raceValue = "Hispanic";
				break;
			case 4:
				raceValue = "Native American";
				break;
			case 5:
				raceValue = "White";
				break;
			default:
				raceValue = " ";
				break;
		}
		return raceValue;
	}

	public static string GetComplexionValue(int index)
	{
		string complexionValue;
		switch (index)
		{
			case 1:
				complexionValue = "Dark";
				break;
			case 2:
				complexionValue = "Fair";
				break;
			case 3:
				complexionValue = "Pale";
				break;
			case 4:
				complexionValue = "Tan";
				break;
			default:
				complexionValue = " ";
				break;
		}
		return complexionValue;
	}

	public static int GetComplexionIndex(string complexionValue)
	{
		int complexionIndex;
		switch (complexionValue)
		{
			case "Dark":
				complexionIndex = 1;
				break;
			case "Fair":
				complexionIndex = 2;
				break;
			case "Pale":
				complexionIndex = 3;
				break;
			case "Tan":
				complexionIndex = 4;
				break;
			default:
				complexionIndex = 0;
				break;
		}
		return complexionIndex;
	}
	
	public static string GetBuildValue(int index)
	{
		string buildValue;
		switch (index)
		{
			case 1:
				buildValue = "Light";
				break;
			case 2:
				buildValue = "Medium";
				break;
			case 3:
				buildValue = "Heavy";
				break;
			default:
				buildValue = " ";
				break;
		}
		return buildValue;
	}

	public static int GetBuildIndex(string buildValue)
	{
		int buildIndex;
		switch (buildValue)
		{
			case "Light":
				buildIndex = 1;
				break;
			case "Medium":
				buildIndex = 2;
				break;
			case "Heavy":
				buildIndex = 3;
				break;
			default:
				buildIndex = 0;
				break;
		}
		return buildIndex;
	}

	public static string GetDDLValue(int index, string field)
	{
		string strValue;
		field = field.ToLower();

		switch (field)
		{
			case "gender":
				strValue = GetGenderValue(index);
				break;
			case "eyecolor":
				strValue = GetEyeColorValue(index);
				break;
			case "haircolor":
				strValue = GetHairColorValue(index);
				break;
			case "race":
				strValue = GetRaceValue(index);
				break;
			case "complexion":
				strValue = GetComplexionValue(index);
				break;
			case "build":
				strValue = GetBuildValue(index);
				break;
			default:
				strValue = " ";
				break;
		}
		return strValue;
	}

	public static string HeightToString(int heightDB)
	{
		int heightIn = heightDB % 12;
		int heightFt = heightDB / 12;

		return heightFt + "' " + heightIn;
	}

	public static int CalculateAge(DateTime DoB)
	{
		DateTime today = DateTime.Today;
		int age = today.Year - DoB.Year;
		if (DoB > today.AddYears(-age))
			age--;

		return age;
	}
}