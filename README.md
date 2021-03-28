# RELACIONES N a N
rails new blog

rails g scaffold Post content:text 

rails g scaffold Tag title

rails g migration CreateJoinTable post tag

rails db:migrate

Modelo Post: has_and_belongs_to_many :tags

Modelo Tag: has_and_belongs_to_many :posts

rails g migration ChangePostsTagsTable 
    rename_table 'posts_tags', 'post_tags'
    add_column :post_tags, :id, :primary_key
    add_column :post_tags, :available, :boolean, default: true

rails db:migrate

Modificamos el modelo Post:
has_many :post_tags
has_many :tags, through: post_tags, dependent: :destroy

Modificamos el modelo Tag:
has_many :post_tags
has_many :posts, through: post_tags, dependent: :destroy

rails g model PostTag

Modelo PostTag: 
belongs_to :post
belongs_to :tag

# CREACION Y RESTRINGIENDO RECURSOS

En routes.rb:
resources: post_tags

rails g scaffold controller PostTags

Views > post_tags > index.html.erb agregar Post ID (post_tag.post.content), Tag ID (post_tag.tag.title) y Available (post_tag.tag.available)

Agregar el campo tags al formulario de posts, asi es mas directo y no se crean 2 formularios independientes.
<%= form.label :tags %>
<%= form.collection_check_boxes (:tag_ids, Tag.all, :id, :title) do |b| %>
    <%= b.label class: 'label-checkbox' do %>
        <%= b.check_box ] b.text %>
    <%= end %>
<%= end %>

Agregar al controlador de Posts el strong param de esta forma: tag_ids: []

En index.html.erb de posts agregaremos los titulos de los tags de esta forma
<%= post.tags.map(&:title).join(', ') %>

Agregar devise al Gemfile

bundle

rails g devise:install

Seguir instrucciones de instalacion

rails generate devise User

rails db:migrate

rails g migration AddEditorToUsers editor:boolean

rails db:migrate

En el controlador Tag agregar:
before_action :authorize_editor!

Ademas, debemos definir este metodo en Application Controller
def authorize_editor!
    unless current_user.editor?
        flash [:alert]= 'You must be an editor to access this section'
        redirect_to root_path
    end
end

# TESTING

En el Gemfile en el area de test:
gem 'rspec-rails'

*TESTING DE CONTROLADORES*

    gem 'rails-controller-testing' 

    bundle

    rails g rspec:install

    rails g rspec:controller Post

    spec > controller > posts_controller_spec.rb

    describe 'GET Index' do
        it 'returns a successful response' do
            get :index
            expect(response).to be_successful
        end

        it 'assigns @posts' do
            post = Post.create(title: 'post title', content: 'short content', author: 'john doe')   #ARRANGE / GIVEN
            posts = Post.all
            get :index    #ACT / WHEN
            expect(assigns(:posts)).to eq(posts)     #ASSERT / THEN
        end

        it 'renders the index template' do
            get :index
            expect(response).to render_template('index')
        end
    end

    En la terminal probamos de la siguiente forma:
    rspec spec spec/controllers/posts_controller_spec.rb

*TESTING DE MODELOS*

    rails g rspec:model Post

    spec > model > post_spec.rb
    it 'is not valid without an author' do
        post = Post.create(title: 'titulo de ejemplo', content:'contenido de ejemplo')
        expect(:post).to_not be_valid
    end

    En la terminal probamos de la siguiente forma:
    rspec spec spec/models/post_spec.rb

