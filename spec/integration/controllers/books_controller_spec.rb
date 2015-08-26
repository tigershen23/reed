require 'integration_helper'

RSpec.describe BooksController, :type => :controller do
  let(:reader) { FactoryGirl.create :reader }
  let(:book) { FactoryGirl.create(:book, reader: reader) }
  let(:book_class) { Book }
  let(:application_controller) { ApplicationController }

  before(:each) do
    allow_any_instance_of(application_controller).to receive(:current_reader) { reader }
  end

  describe '#index' do
    before do
      get :index, {}
    end

    it 'responds with success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders index template' do
      expect(response).to render_template(:index)
    end
  end

  describe '#create' do
    before { get :index, {} } # create the guest user and first book

    context 'with AJAX' do
      it 'creates a book' do
        expect do
          xhr :post, :create, { book: book_create_params }
        end.to change(Book, :count).by(1)
      end
    end
  end

  describe '#edit' do
  end

  describe '#update' do
    before { get :index, {} } # create the guest user and first book

    context 'with AJAX' do
      it 'edits the book' do
        expect do
          xhr :put, :update, { id: book.id, book: book_update_params }
        end.to change{ book.reload.description }
      end
    end
  end

  describe '#destroy' do
    before { get :index, {} }

    context 'with AJAX' do
      let!(:book) { FactoryGirl.create(:book) }

      it 'deletes a book' do
        expect do
          xhr :delete, :destroy, { id: book.id }
        end.to change(Book, :count).by(-1)
      end
    end
  end

  def book_create_params
    {
        title: Faker::Company.name,
        author: Faker::Name.name,
        description: Faker::Lorem.sentence,
        amazon_id: Faker::Bitcoin.address
    }
  end

  def book_update_params
    {
        description: Faker::Lorem.sentence
    }
  end
end

