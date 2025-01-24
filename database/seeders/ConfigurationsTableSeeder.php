<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Configuration;

class ConfigurationsTableSeeder extends Seeder
{
    public function run(): void
    {
        $configurations = [
            // Project Types
            [
                'type' => 'project_type',
                'key' => 'standard',
                'label' => 'Standard Product',
                'sort_order' => 1
            ],
            [
                'type' => 'project_type',
                'key' => 'skid_mounted',
                'label' => 'Skid Mounted System',
                'sort_order' => 2
            ],
            [
                'type' => 'project_type',
                'key' => 'custom',
                'label' => 'Custom Project',
                'sort_order' => 3
            ],

            // Document Types
            [
                'type' => 'document_type',
                'key' => 'rfq',
                'label' => 'RFQ Document',
                'sort_order' => 1
            ],
            [
                'type' => 'document_type',
                'key' => 'technical_specification',
                'label' => 'Technical Specification',
                'sort_order' => 2
            ],
            // ... add other document types
        ];

        foreach ($configurations as $config) {
            Configuration::create($config);
        }
    }
}
