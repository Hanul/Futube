public partial class MainView: Fuse.App
{
    public sealed class Fuse_Controls_TextControl_string_Value_Property: Uno.UX.Property<string>
    {
        Fuse.Controls.TextControl _obj;
        public Fuse_Controls_TextControl_string_Value_Property(Fuse.Controls.TextControl obj) { _obj = obj; }
        protected override string OnGet() { return _obj.Value; }
        protected override void OnSet(string v, object origin) { _obj.SetValue(v, origin); }
        protected override void OnAddListener(Uno.UX.ValueChangedHandler<string> listener) { _obj.ValueChanged += listener; }
        protected override void OnRemoveListener(Uno.UX.ValueChangedHandler<string> listener) { _obj.ValueChanged -= listener; }
    }
    public sealed class Fuse_Navigation_DirectNavigation_Fuse_Node_Active_Property: Uno.UX.Property<Fuse.Node>
    {
        Fuse.Navigation.DirectNavigation _obj;
        public Fuse_Navigation_DirectNavigation_Fuse_Node_Active_Property(Fuse.Navigation.DirectNavigation obj) { _obj = obj; }
        protected override Fuse.Node OnGet() { return _obj.Active; }
        protected override void OnSet(Fuse.Node v, object origin) { _obj.Active = v; }
    }
    public sealed class Fuse_Reactive_Each_object_Items_Property: Uno.UX.Property<object>
    {
        Fuse.Reactive.Each _obj;
        public Fuse_Reactive_Each_object_Items_Property(Fuse.Reactive.Each obj) { _obj = obj; }
        protected override object OnGet() { return _obj.Items; }
        protected override void OnSet(object v, object origin) { _obj.Items = v; }
    }
    public sealed class Fuse_Node_string_Name_Property: Uno.UX.Property<string>
    {
        Fuse.Node _obj;
        public Fuse_Node_string_Name_Property(Fuse.Node obj) { _obj = obj; }
        protected override string OnGet() { return _obj.Name; }
        protected override void OnSet(string v, object origin) { _obj.Name = v; }
    }
    public sealed class Fuse_Controls_Image_string_Url_Property: Uno.UX.Property<string>
    {
        Fuse.Controls.Image _obj;
        public Fuse_Controls_Image_string_Url_Property(Fuse.Controls.Image obj) { _obj = obj; }
        protected override string OnGet() { return _obj.Url; }
        protected override void OnSet(string v, object origin) { _obj.Url = v; }
    }
    public sealed class Fuse_Elements_Element_float_Opacity_Property: Uno.UX.Property<float>
    {
        Fuse.Elements.Element _obj;
        public Fuse_Elements_Element_float_Opacity_Property(Fuse.Elements.Element obj) { _obj = obj; }
        protected override float OnGet() { return _obj.Opacity; }
        protected override void OnSet(float v, object origin) { _obj.Opacity = v; }
    }
    public partial class Factory: Uno.UX.IFactory
    {
        internal readonly MainView __parent;
        public Factory(MainView parent)
        {
            __parent = parent;
        }
        MainView.Fuse_Controls_TextControl_string_Value_Property temp_Value_inst;
        internal Fuse.Reactive.EventBinding temp_eb1;
        static Factory()
        {
        }
        public object New()
        {
            var self = new Fuse.Controls.Button();
            var temp = new ButtonText();
            temp_Value_inst = new MainView.Fuse_Controls_TextControl_string_Value_Property(temp);
            var temp1 = new Fuse.Controls.Rectangle();
            var temp2 = new Fuse.Drawing.StaticSolidColor(float4(1f, 0.5137255f, 0.3843137f, 1f));
            var temp3 = new Fuse.Reactive.DataBinding<string>(temp_Value_inst, "title");
            var temp_eb1 = new Fuse.Reactive.EventBinding("pageButtonClicked");
            self.Height = 50f;
            self.Margin = float4(5f, 5f, 5f, 5f);
            self.IgnoreStyle = true;
            global::Fuse.Gestures.Clicked.AddHandler(self, temp_eb1.OnEvent);
            temp1.CornerRadius = float4(3f, 3f, 3f, 3f);
            global::Fuse.Layouts.Layout.SetLayer(temp1, Fuse.Layouts.Layer.Background);
            temp1.Fill = temp2;
            temp.FontSize = 13f;
            temp.TextAlignment = Fuse.Elements.TextAlignment.Center;
            temp.TextColor = float4(1f, 1f, 1f, 1f);
            temp.Behaviors.Add(temp3);
            self.Children.Add(temp1);
            self.Children.Add(temp);
            self.Behaviors.Add(temp_eb1);
            return self;
        }
    }
    public partial class Factory1: Uno.UX.IFactory
    {
        internal readonly MainView __parent;
        public Factory1(MainView parent)
        {
            __parent = parent;
        }
        MainView.Fuse_Controls_TextControl_string_Value_Property temp_Value_inst;
        MainView.Fuse_Controls_Image_string_Url_Property temp1_Url_inst;
        MainView.Fuse_Node_string_Name_Property self_Name_inst;
        static Factory1()
        {
        }
        public object New()
        {
            var self = new Fuse.Controls.Page();
            var temp = new Fuse.Controls.Text();
            temp_Value_inst = new MainView.Fuse_Controls_TextControl_string_Value_Property(temp);
            var temp1 = new Fuse.Controls.Image();
            temp1_Url_inst = new MainView.Fuse_Controls_Image_string_Url_Property(temp1);
            self_Name_inst = new MainView.Fuse_Node_string_Name_Property(self);
            var temp2 = new Fuse.Reactive.DataBinding<string>(temp_Value_inst, "title");
            var temp3 = new Fuse.Reactive.DataBinding<string>(temp1_Url_inst, "thumbnail");
            var temp4 = new Fuse.Navigation.ExitingAnimation();
            var temp5 = new Fuse.Animations.Move();
            var temp6 = new Fuse.Reactive.DataBinding<string>(self_Name_inst, "handle");
            temp.FontSize = 50f;
            temp.TextColor = float4(0.2352941f, 0.2745098f, 0.3882353f, 1f);
            temp.Alignment = Fuse.Elements.Alignment.TopCenter;
            temp.Behaviors.Add(temp2);
            temp1.Alignment = Fuse.Elements.Alignment.Center;
            temp1.Behaviors.Add(temp3);
            temp4.Animators.Add(temp5);
            temp5.X = 1f;
            temp5.Easing = Fuse.Animations.Easing.CircularInOut;
            temp5.Duration = 0.3;
            temp5.RelativeTo = Fuse.TranslationModes.Size;
            self.Children.Add(temp);
            self.Children.Add(temp1);
            self.Behaviors.Add(temp6);
            self.Behaviors.Add(temp4);
            return self;
        }
    }
    MainView.Fuse_Controls_TextControl_string_Value_Property temp_Value_inst;
    MainView.Fuse_Reactive_Each_object_Items_Property temp1_Items_inst;
    MainView.Fuse_Elements_Element_float_Opacity_Property backButton_Opacity_inst;
    MainView.Fuse_Navigation_DirectNavigation_Fuse_Node_Active_Property temp2_Active_inst;
    MainView.Fuse_Reactive_Each_object_Items_Property temp3_Items_inst;
    internal Fuse.Controls.Button backButton;
    internal Fuse.Reactive.EventBinding temp_eb0;
    internal Fuse.Controls.Page pagesList;
    static MainView()
    {
    }
    public MainView()
    {
        InitializeUX();
    }
    internal void InitializeUX()
    {
        var temp = new Fuse.Controls.Text();
        temp_Value_inst = new MainView.Fuse_Controls_TextControl_string_Value_Property(temp);
        var temp1 = new Fuse.Reactive.Each();
        temp1_Items_inst = new MainView.Fuse_Reactive_Each_object_Items_Property(temp1);
        backButton = new Fuse.Controls.Button();
        backButton_Opacity_inst = new MainView.Fuse_Elements_Element_float_Opacity_Property(backButton);
        var temp2 = new Fuse.Navigation.DirectNavigation();
        temp2_Active_inst = new MainView.Fuse_Navigation_DirectNavigation_Fuse_Node_Active_Property(temp2);
        var temp3 = new Fuse.Reactive.Each();
        temp3_Items_inst = new MainView.Fuse_Reactive_Each_object_Items_Property(temp3);
        var temp4 = new Fuse.Controls.DockPanel();
        var temp5 = new Fuse.Reactive.JavaScript();
        var temp6 = new Fuse.Controls.StackPanel();
        var temp7 = new Fuse.Controls.StatusBarBackground();
        var temp8 = new Fuse.iOS.StatusBarConfig();
        var temp9 = new Fuse.Controls.Panel();
        var temp10 = new Fuse.Reactive.DataBinding<string>(temp_Value_inst, "currentPageTitle");
        var temp11 = new Fuse.Controls.DockPanel();
        var temp12 = new Fuse.Controls.Image();
        var temp13 = new Fuse.Controls.Text();
        temp_eb0 = new Fuse.Reactive.EventBinding("goBack");
        var temp14 = new Fuse.Drawing.StaticSolidColor(float4(0.2352941f, 0.7098039f, 0.8156863f, 1f));
        pagesList = new Fuse.Controls.Page();
        var temp15 = new Fuse.Controls.ScrollView();
        var temp16 = new Fuse.Controls.StackPanel();
        var temp17 = new Factory(this);
        var temp18 = new Fuse.Reactive.DataBinding<object>(temp1_Items_inst, "pages");
        var temp19 = new Fuse.Navigation.ExitingAnimation();
        var temp20 = new Fuse.Animations.Move();
        var temp21 = new Fuse.Animations.Change<float>(backButton_Opacity_inst);
        var __handle_ = new Factory1(this);
        var temp22 = new Fuse.Reactive.DataBinding<Fuse.Node>(temp2_Active_inst, "currentPageHandle");
        var temp23 = new Fuse.Reactive.DataBinding<object>(temp3_Items_inst, "pages");
        this.Background = float4(0.9333333f, 0.9333333f, 0.9333333f, 1f);
        temp4.Children.Add(temp6);
        temp4.Children.Add(pagesList);
        temp4.Behaviors.Add(temp22);
        temp4.Behaviors.Add(temp23);
        temp4.Behaviors.Add(temp5);
        temp4.Behaviors.Add(temp2);
        temp4.Behaviors.Add(temp3);
        temp5.LineNumber = 3;
        temp5.FileName = "MainView.ux";
        temp5.File = new global::Uno.UX.BundleFileSource(import global::Uno.BundleFile("../../MainView.js"));
        global::Fuse.Controls.DockPanel.SetDock(temp6, Fuse.Layouts.Dock.Top);
        temp6.Background = temp14;
        temp6.Children.Add(temp7);
        temp6.Children.Add(temp9);
        temp6.Behaviors.Add(temp8);
        temp8.Style = Uno.Platform.iOS.StatusBarStyle.Light;
        temp9.Height = 50f;
        global::Fuse.Controls.DockPanel.SetDock(temp9, Fuse.Layouts.Dock.Top);
        temp9.Children.Add(temp);
        temp9.Children.Add(backButton);
        temp.FontSize = 25f;
        temp.TextColor = float4(1f, 1f, 1f, 1f);
        temp.Alignment = Fuse.Elements.Alignment.Center;
        temp.Behaviors.Add(temp10);
        backButton.HitTestMode = Fuse.Elements.HitTestMode.LocalBounds;
        backButton.Width = 90f;
        backButton.Height = 50f;
        backButton.Alignment = Fuse.Elements.Alignment.Left;
        backButton.Padding = float4(20f, 0f, 0f, 0f);
        backButton.Opacity = 0f;
        backButton.Name = "backButton";
        backButton.IgnoreStyle = true;
        global::Fuse.Gestures.Clicked.AddHandler(backButton, temp_eb0.OnEvent);
        backButton.Children.Add(temp11);
        backButton.Behaviors.Add(temp_eb0);
        temp11.Children.Add(temp12);
        temp11.Children.Add(temp13);
        temp12.Color = float4(1f, 1f, 1f, 1f);
        temp12.Height = 20f;
        global::Fuse.Controls.DockPanel.SetDock(temp12, Fuse.Layouts.Dock.Left);
        temp12.File = new global::Uno.UX.BundleFileSource(import global::Uno.BundleFile("../../arrow-left-white.png"));
        temp13.FontSize = 20f;
        temp13.TextAlignment = Fuse.Elements.TextAlignment.Center;
        temp13.TextColor = float4(1f, 1f, 1f, 1f);
        temp13.Alignment = Fuse.Elements.Alignment.Center;
        temp13.Margin = float4(5f, 0f, 0f, 0f);
        global::Fuse.Controls.DockPanel.SetDock(temp13, Fuse.Layouts.Dock.Right);
        pagesList.Name = "pagesList";
        pagesList.Children.Add(temp15);
        pagesList.Behaviors.Add(temp19);
        temp15.Content = temp16;
        temp16.Behaviors.Add(temp18);
        temp16.Behaviors.Add(temp1);
        temp1.Factories.Add(temp17);
        temp19.Animators.Add(temp20);
        temp19.Animators.Add(temp21);
        temp20.X = -1f;
        temp20.Easing = Fuse.Animations.Easing.CircularInOut;
        temp20.Duration = 0.3;
        temp20.RelativeTo = Fuse.TranslationModes.Size;
        temp21.Value = 1f;
        temp21.Duration = 0.3;
        temp3.Factories.Add(__handle_);
        this.RootNode = temp4;
        this.Theme = Fuse.BasicTheme.BasicTheme.Singleton;
    }
}
