                                                                                 local CoreGui=game:   
                                                                        GetService("CoreGui");local TweenService=game:  
                                                                    GetService("TweenService");local Lighting=game:GetService(    
                                                                "Lighting");if CoreGui:FindFirstChild("FishHubUltimate") then CoreGui.  
                                                            FishHubUltimate:Destroy();end local ScreenGui=Instance.new("ScreenGui");      
                                                          ScreenGui.Name="FishHubUltimate";ScreenGui.Parent=CoreGui;ScreenGui.ResetOnSpawn= 
                                                        false;ScreenGui.DisplayOrder=999999;local C_BG=Color3.fromRGB(12,14,22);local C_CYAN= 
                                                      Color3.fromRGB(0,240,255);local C_PURPLE=Color3.fromRGB(139,92,246);local KEY_FILE=       
                                                    "FishHub_SavedKey.txt";local WEBSITE_URL="https://fishhub-online.netlify.app/";local          
                                                  ADMIN_KEY="DaoHuyLam22052009";local function round(obj,radius) local uic=Instance.new("UICorner") 
                                                  ;uic.CornerRadius=UDim.new(0,radius);uic.Parent=obj;end local function checkKeyValid(keyStr) if (   
                                                not keyStr or (type(keyStr)~="string")) then return false;end if (keyStr==ADMIN_KEY) then return true;  
                                                end local split=string.split(keyStr,"-");if (( #split>=3) and (split[1]=="FishHub")) then local ts=       
                                              tonumber(split[3]);if (ts and ((os.time() -ts)<=86400)) then return true;end end return false;end local       
                                              function loadMainUI() pcall(function() local code=game:HttpGet(                                               
                                            "https://raw.githubusercontent.com/Cachuoine/DHL/refs/heads/main/UI.lua");if (code and (code~="")) then           
                                            loadstring(code)();end end);end local BlurEffect=Instance.new("BlurEffect",Lighting);BlurEffect.Size=0;TweenService 
                                          :Create(BlurEffect,TweenInfo.new(0.8),{Size=22}):Play();local LoadBg=Instance.new("Frame",ScreenGui);LoadBg.Size=UDim2. 
                                          new(0,320,0,160);LoadBg.Position=UDim2.new(0.5,0,0.5,0);LoadBg.AnchorPoint=Vector2.new(0.5,0.5);LoadBg.BackgroundColor3=  
                                          C_BG;LoadBg.BackgroundTransparency=0.15;LoadBg.ClipsDescendants=true;round(LoadBg,18);local LoadStroke=Instance.new(        
                                          "UIStroke",LoadBg);LoadStroke.Color=C_CYAN;LoadStroke.Thickness=1.5;LoadStroke.Transparency=0.3;local AnchorIcon=Instance.  
                                        new("TextLabel",LoadBg);AnchorIcon.Size=UDim2.new(0,50,0,50);AnchorIcon.Position=UDim2.new(0.5, -25,0.2,0);AnchorIcon.          
                                        BackgroundTransparency=1;AnchorIcon.Font=Enum.Font.GothamBold;        --[[==============================]]AnchorIcon.Text="⚓";    
                                        AnchorIcon.TextColor3=C_CYAN;AnchorIcon.TextSize=28;local   --[[============================================]]LoadText=Instance.  
                                        new("TextLabel",LoadBg);LoadText.Size=UDim2.new(1,0,0,  --[[======================================================]]30);LoadText.   
                                      Position=UDim2.new(0,0,0.65,0);LoadText.              --[[==========================================================]]                  
                                      BackgroundTransparency=1;LoadText.Font=Enum.Font.   --[[==============================================================]]GothamBold;     
                                      LoadText.Text="ESTABLISHING SECURE PROTOCOL...";    --[[================================================================]]LoadText.       
                                      TextColor3=C_CYAN;LoadText.TextSize=11;local        --[[==================================================================]]spinAnchor=   
                                      TweenService:Create(AnchorIcon,TweenInfo.new(1,Enum --[[==================================================================]].EasingStyle.     
                                    Quad,Enum.EasingDirection.InOut),{Rotation=360});     --[[====================================================================]]spinAnchor:   
                    Play();local KeyMain=Instance.new("Frame",ScreenGui);KeyMain.Size=    --[[====================================================================]]UDim2.new(0,440 
              ,0,300);KeyMain.Position=UDim2.new(0.5,0,0.5,0);KeyMain.AnchorPoint=Vector2 --[[======================================================================]].new(0.5,0.5) 
            ;KeyMain.BackgroundColor3=C_BG;KeyMain.BackgroundTransparency=1;KeyMain.      --[[======================================================================]]Visible=false 
          ;round(KeyMain,22);local MainStroke=Instance.new("UIStroke",KeyMain);MainStroke --[[======================================================================]].Color=C_CYAN 
        ;MainStroke.Thickness=1.5;MainStroke.Transparency=1;local TopNeonBar=Instance.new --[[======================================================================]]("Frame",     
        KeyMain);TopNeonBar.Size=UDim2.new(0,80,0,3);TopNeonBar.Position=UDim2.new(0.5, - --[[======================================================================]]40,0,0);      
      TopNeonBar.BackgroundColor3=C_PURPLE;TopNeonBar.BackgroundTransparency=1;round(     --[[======================================================================]]TopNeonBar,2) 
      ;local BtnClose=Instance.new("TextButton",KeyMain);BtnClose.Size=UDim2.new(0,30,0,30) --[[==================================================================]];BtnClose.      
      Position=UDim2.new(1, -38,0,14);BtnClose.BackgroundColor3=Color3.fromRGB(239,68,68);  --[[================================================================]]BtnClose.         
    BackgroundTransparency=1;BtnClose.Font=Enum.Font.GothamBold;BtnClose.Text="×";BtnClose. --[[==============================================================]]TextColor3=Color3 
    .fromRGB(255,255,255);BtnClose.TextSize=16;BtnClose.TextTransparency=1;round(BtnClose,8); --[[==========================================================]]local TitleIcon=    
    Instance.new("TextLabel",KeyMain);TitleIcon.Size=UDim2.new(0,30,0,45);TitleIcon.Position=   --[[====================================================]]UDim2.new(0,20,0,15);   
    TitleIcon.BackgroundTransparency=1;TitleIcon.Font=Enum.Font.GothamBold;TitleIcon.Text="🛡️";  --[[==============================================]]TitleIcon.TextSize=18;    
    TitleIcon.TextTransparency=1;local Title=Instance.new("TextLabel",KeyMain);Title.Size=UDim2.new(1 --[[====================================]], -80,0,45);Title.Position=   
    UDim2.new(0,50,0,15);Title.BackgroundTransparency=1;Title.Font=Enum.Font.GothamBlack;Title.Text=      --[[========================]]"FISHHUB SECURITY";Title.TextColor3=  
    Color3.fromRGB(255,255,255);Title.TextSize=20;Title.TextTransparency=1;Title.TextXAlignment=Enum.TextXAlignment.Left;local Divider=Instance.new("Frame",KeyMain);       
  Divider.Size=UDim2.new(0.85,0,0,1);Divider.Position=UDim2.new(0.075,0,0.23,0);Divider.BackgroundColor3=Color3.fromRGB(45,52,75);Divider.BackgroundTransparency=1;local  
  BoxWrap=Instance.new("Frame",KeyMain);BoxWrap.Size=UDim2.new(0.85,0,0,46);BoxWrap.Position=UDim2.new(0.075,0,0.3,0);BoxWrap.BackgroundColor3=Color3.fromRGB(18,22,35) 
  ;BoxWrap.BackgroundTransparency=1;round(BoxWrap,10);local BoxStroke=Instance.new("UIStroke",BoxWrap);BoxStroke.Color=Color3.fromRGB(70,75,105);BoxStroke.Transparency=1 
  ;local InputKey=Instance.new("TextBox",BoxWrap);InputKey.Size=UDim2.new(1, -20,1,0);InputKey.Position=UDim2.new(0,10,0,0);InputKey.BackgroundTransparency=1;InputKey.   
  Font=Enum.Font.GothamMedium;InputKey.PlaceholderText="Paste your Access Token here...";InputKey.PlaceholderColor3=Color3.fromRGB(110,120,150);InputKey.Text="";InputKey 
  .TextColor3=C_CYAN;InputKey.TextSize=13;InputKey.TextTransparency=1;InputKey.ClearTextOnFocus=false;local BtnCheck=Instance.new("TextButton",KeyMain);BtnCheck.Size=    
  UDim2.new(0.4,0,0,42);BtnCheck.Position=UDim2.new(0.075,0,0.58,0);BtnCheck.BackgroundColor3=C_CYAN;BtnCheck.BackgroundTransparency=1;BtnCheck.Font=Enum.Font.GothamBold 
  ;BtnCheck.Text="VERIFY KEY";BtnCheck.TextColor3=Color3.fromRGB(12,14,22);BtnCheck.TextSize=13;BtnCheck.TextTransparency=1;round(BtnCheck,10);local BtnGet=Instance.new( 
  "TextButton",KeyMain);BtnGet.Size=UDim2.new(0.4,0,0,42);BtnGet.Position=UDim2.new(0.525,0,0.58,0);BtnGet.BackgroundColor3=Color3.fromRGB(35,40,65);BtnGet.              
  BackgroundTransparency=1;BtnGet.Font=Enum.Font.GothamBold;BtnGet.Text="GET KEY";BtnGet.TextColor3=Color3.fromRGB(255,255,255);BtnGet.TextSize=13;BtnGet.                
  TextTransparency=1;round(BtnGet,10);local InfoBox=Instance.new("Frame",KeyMain);InfoBox.Size=UDim2.new(0.85,0,0,38);InfoBox.Position=UDim2.new(0.075,0,0.74,0);InfoBox. 
  BackgroundColor3=Color3.fromRGB(16,20,32);InfoBox.BackgroundTransparency=1;round(InfoBox,8);local InfoStroke=Instance.new("UIStroke",InfoBox);InfoStroke.Color=Color3.    
  fromRGB(35,42,65);InfoStroke.Transparency=1;local InfoText=Instance.new("TextLabel",InfoBox);InfoText.Size=UDim2.new(1, -20,1,0);InfoText.Position=UDim2.new(0,10,0,0);   
  InfoText.BackgroundTransparency=1;InfoText.Font=Enum.Font.Gotham;InfoText.Text="💡 Tip: Keys remain valid for 24 hours after activation.";InfoText.TextColor3=Color3.     
  fromRGB(130,140,170);InfoText.TextSize=10;InfoText.TextTransparency=1;InfoText.TextXAlignment=Enum.TextXAlignment.Left;local SettingsLabel=Instance.new("TextLabel",      
  KeyMain);SettingsLabel.Size=UDim2.new(0.85,0,0,20);SettingsLabel.Position=UDim2.new(0.075,0,0.88,0);SettingsLabel.BackgroundTransparency=1;SettingsLabel.Font=Enum.Font.  
  GothamBold;SettingsLabel.Text="SYSTEM CONFIGURATION & SECURITY";SettingsLabel.TextColor3=Color3.fromRGB(100,110,140);SettingsLabel.TextSize=9;SettingsLabel.              
  TextTransparency=1;task.spawn(function() spinAnchor.Completed:Wait();LoadText.Text="CHECKING SAVED CREDENTIALS...";task.wait(0.5);local autoPassed=false;if (writefile    
  and readfile and isfile and isfile(KEY_FILE)) then local ok,saved=pcall(function() return readfile(KEY_FILE);end);if (ok and checkKeyValid(saved)) then autoPassed=true;  
  end end if autoPassed then LoadText.Text="AUTO-LOGGED IN SUCCESSFULLY!";LoadText.TextColor3=Color3.fromRGB(34,197,94);task.wait(0.6);TweenService:Create(BlurEffect,      
  TweenInfo.new(0.6),{Size=0}):Play();TweenService:Create(LoadBg,TweenInfo.new(0.4),{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1}):Play();task.wait(0.5);BlurEffect:   
  Destroy();ScreenGui:Destroy();loadMainUI();return;end TweenService:Create(LoadBg,TweenInfo.new(0.4),{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1}):Play();task.wait( 
  0.3);LoadBg.Visible=false;KeyMain.Visible=true;TweenService:Create(KeyMain,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{BackgroundTransparency=0.08 
  }):Play();TweenService:Create(MainStroke,TweenInfo.new(0.5),{Transparency=0.3}):Play();TweenService:Create(TopNeonBar,TweenInfo.new(0.5),{BackgroundTransparency=0}):Play 
  ();TweenService:Create(BtnClose,TweenInfo.new(0.5),{BackgroundTransparency=0.2,TextTransparency=0}):Play();TweenService:Create(TitleIcon,TweenInfo.new(0.5),{           
  TextTransparency=0}):Play();TweenService:Create(Title,TweenInfo.new(0.5),{TextTransparency=0}):Play();TweenService:Create(Divider,TweenInfo.new(0.5),{                  
  BackgroundTransparency=0}):Play();TweenService:Create(BoxWrap,TweenInfo.new(0.5),{BackgroundTransparency=0.2}):Play();TweenService:Create(BoxStroke,TweenInfo.new(0.5), 
    {Transparency=0}):Play();TweenService:Create(InputKey,TweenInfo.new(0.5),{TextTransparency=0}):Play();TweenService:Create(BtnCheck,TweenInfo.new(0.5),{               
    BackgroundTransparency=0,TextTransparency=0}):Play();TweenService:Create(BtnGet,TweenInfo.new(0.5),{BackgroundTransparency=0,TextTransparency=0}):Play();TweenService 
    :Create(InfoBox,TweenInfo.new(0.5),{BackgroundTransparency=0.2}):Play();TweenService:Create(InfoStroke,TweenInfo.new(0.5),{Transparency=0}):Play();TweenService:      
    Create(InfoText,TweenInfo.new(0.5),{TextTransparency=0}):Play();TweenService:Create(SettingsLabel,TweenInfo.new(0.5),{TextTransparency=0}):Play();end);BtnCheck.      
      MouseEnter:Connect(function() TweenService:Create(BtnCheck,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(0,210,230),Size=UDim2.new(0.4,0,0,44)}):Play();end 
      );BtnCheck.MouseLeave:Connect(function() TweenService:Create(BtnCheck,TweenInfo.new(0.2),{BackgroundColor3=C_CYAN,Size=UDim2.new(0.4,0,0,42)}):Play();end);BtnGet 
      .MouseEnter:Connect(function() TweenService:Create(BtnGet,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(50,58,90),Size=UDim2.new(0.4,0,0,44)}):Play();end); 
        BtnGet.MouseLeave:Connect(function() TweenService:Create(BtnGet,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(35,40,65),Size=UDim2.new(0.4,0,0,42)}):Play 
        ();end);BtnClose.MouseEnter:Connect(function() TweenService:Create(BtnClose,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(220,38,38),Rotation=90}):Play() 
        ;end);BtnClose.MouseLeave:Connect(function() TweenService:Create(BtnClose,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(239,68,68),Rotation=0}):Play();   
          end);BtnClose.MouseButton1Click:Connect(function() TweenService:Create(BlurEffect,TweenInfo.new(0.4),{Size=0}):Play();local animOut=TweenService:Create(    
            KeyMain,TweenInfo.new(0.35,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1,Rotation= -15});for _,v in    
              ipairs(KeyMain:GetDescendants()) do if (v:IsA("TextLabel") or v:IsA("TextBox") or v:IsA("TextButton")) then TweenService:Create(v,TweenInfo.new(0.2),{  
                TextTransparency=1}):Play();elseif v:IsA("UIStroke") then TweenService:Create(v,TweenInfo.new(0.2),{Transparency=1}):Play();elseif v:IsA("Frame")     
                  then TweenService:Create(v,TweenInfo.new(0.2),{BackgroundTransparency=1}):Play();end end animOut:Play();animOut.Completed:Wait();BlurEffect:      
                      Destroy();ScreenGui:Destroy();end);BtnGet.MouseButton1Click:Connect(function() if setclipboard then setclipboard(WEBSITE_URL);end Title.Text= 
                                  "URL COPIED TO CLIPBOARD!";Title.TextColor3=C_CYAN;task.wait(1.5);Title.Text="FISHHUB SECURITY";Title.TextColor3=Color3.fromRGB(  
                                      255,255,255);end);BtnCheck.MouseButton1Click:Connect(function() local userKey=InputKey.Text;if checkKeyValid(userKey) then if 
                                       writefile then pcall(function() writefile(KEY_FILE,userKey);         end);end Title.Text=((userKey==ADMIN_KEY) and           
                                      "ADMIN ACCESS GRANTED!") or "ACCESS GRANTED!" ;Title.                 TextColor3=Color3.fromRGB(34,197,94);MainStroke.Color 
                                      =Color3.fromRGB(34,197,94);task.wait(0.6);TweenService:Create         (BlurEffect,TweenInfo.new(0.5),{Size=0}):Play();local 
                                       closeTween=TweenService:Create(KeyMain,TweenInfo.new(0.4,            Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size= 
                                      UDim2.new(0,0,0,0),BackgroundTransparency=1});for _,v in                ipairs(KeyMain:GetDescendants()) do if (v:IsA(      
                                      "TextLabel") or v:IsA("TextBox") or v:IsA("TextButton")) then            TweenService:Create(v,TweenInfo.new(0.2),{         
                                      TextTransparency=1}):Play();elseif v:IsA("UIStroke") then               TweenService:Create(v,TweenInfo.new(0.2),{        
                                        Transparency=1}):Play();elseif v:IsA("Frame") then                    TweenService:Create(v,TweenInfo.new(0.2),{        
                                        BackgroundTransparency=1}):Play();end end closeTween:Play()             ;closeTween.Completed:Wait();BlurEffect:Destroy 
                                        ();ScreenGui:Destroy();loadMainUI();else Title.Text=                    "INVALID OR EXPIRED KEY!";Title.TextColor3=   
                                        Color3.fromRGB(239,68,68);BoxStroke.Color=Color3.fromRGB(               239,68,68);task.wait(1.2);Title.Text=         
                                        "FISHHUB SECURITY";Title.TextColor3=Color3.fromRGB(255,                   255,255);BoxStroke.Color=Color3.fromRGB(  
                                        70,75,105);end end);
