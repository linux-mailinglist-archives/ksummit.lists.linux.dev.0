Return-Path: <ksummit+bounces-1193-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E033F7BA8B3
	for <lists@lfdr.de>; Thu,  5 Oct 2023 20:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 9196528216B
	for <lists@lfdr.de>; Thu,  5 Oct 2023 18:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C923D3AF;
	Thu,  5 Oct 2023 18:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZnWGiEXt"
X-Original-To: ksummit@lists.linux.dev
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA152374C
	for <ksummit@lists.linux.dev>; Thu,  5 Oct 2023 18:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leKAH7UenSZ8d7WtlDsd4W+J9WdS70P3qRZyiJixSllrcEJOuI61lYZibB2LJwtuFtn9jSf5Z7eiZbBScgFqZAsUh7FctD1rfWS+XRxVq9KRTaj1yBldE7FlVj4pNP5+z+cLr4KhnMEZg9jUQ+rI2jG5e8iZbaf4B4KD27mUUclfN6KYhGgoXGvOcWE8/8p/DonShEoGixTqun3Qe05xOWksrAtaDNSpJ4aPwSeKFKdf9FAhxwWhhgW/DLzlU6RlGEeJACGVc6a2q0f6SLla9fP/wmKVuEWbg1mAG+zR0OJs991OLj6ao35RnA+HFAz8goboUMPGT6xp55J57DPs7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bM4ySFwQNORhRlogiueCKvZX3GbZtB6DZpuf/7T5IQI=;
 b=hp3iQGMLYPWqxUamJtJGHJvGbxbhNeq1SlfL/2bYenqpwYzyALcUXKbMOgUmvujI3bXRpyNrfHnxPRCy3e+i1ajT3WUUTKcOF5WNXep7rSUSXQLZ/h+YZv78jcImzh5uKN8mphC7xBcgEhJ+xclHsIjnT76otOo3iUo1+VR2JLkK9Jj1d+dIN2JLwPPLxErdg0Es/1C+8c8fHP1K6Y8X1EdqtXdhh7SIbnJ7YZdzhXR61TMnkP/dUyyUtlmOEvRVX5aKGLWS9NdBTUQoVfNi3VEaeCRpIvxPrr/2Oc5RVUp7PUjKhzEokuzxNaV3VKMLoKB7uxswDfImVmuRXoQHGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bM4ySFwQNORhRlogiueCKvZX3GbZtB6DZpuf/7T5IQI=;
 b=ZnWGiEXtHb+BEwsDe/TH3XMAtFsX8sBhY4W8RDmbj/e0hsMy7rnh1XG8VfDObsW3vzzRpMd0l+57DvKobfvFjmiDLoQjzifLjryPwjgK/SLeOh5TTNBFx9dFtx1pPQBP3/IlfL596rtfDie5jV/0aiOjILfXxI4YsoQ7bEq2181u8ryJXu1NSc3v2rYpiX9wUjp0VJWdMzjemgnskD50UcKNqZnK80tc+L4xsuKyB+9PPszMJ7emTCFFIAWrld1mUyMjkvpnK0bGrXB+hu86deo4AIJwA4QcrtBC9+TwJ2sLWH9A424JxIK0NMLCaYICVzg5DNQtmJw4jN1Bwi3oMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6226.namprd12.prod.outlook.com (2603:10b6:930:22::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Thu, 5 Oct
 2023 18:08:34 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2%6]) with mapi id 15.20.6838.030; Thu, 5 Oct 2023
 18:08:34 +0000
Date: Thu, 5 Oct 2023 15:08:33 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mark Brown <broonie@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, ksummit@lists.linux.dev,
	tech-board-discuss@lists.linux-foundation.org
Subject: Re: [MAINTAINERS SUMMIT] Maintainers Support Group
Message-ID: <20231005180833.GA975221@nvidia.com>
References: <20230919121001.7bc610d4@gandalf.local.home>
 <b7f6d444-a3c0-459d-a683-8ea2e160160d@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7f6d444-a3c0-459d-a683-8ea2e160160d@sirena.org.uk>
X-ClientProxiedBy: BLAPR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:208:32f::6) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: fa23d718-bd5d-4d92-c2c5-08dbc5ce16fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2keiWuACO9KTdySP6Del51OPDaCmuMNgtDdvRNAI8sA8Xm3olRUhq35aGNVGs4cQbrU8/rj00qc9FV2i4SbSuZs10V3RSYaNfSHJuwo+aJHs6vnpgeMFspIZeZdWmKsPhlo+CG+ex3R9Sb9AoDEgSjkMskwo8FJ+Z0b+96XnavdNwkzfmWAdaMQyQjwCEBnRVRQjNKBkecZBeOfnqjyTEuSqGLhSgyZkwO3xo8pq80zOsiUPcohva4j+uIO9FDtP6hQl/Dp2ZUt1FtICHZwk7BmOBiHwtNoWkNeMqfphRSO/DnKeXzHdCjNXT66SUnArGtIaBneS+i6PzVmxg8k41IHmC3YwaxYUK5e/X6oyqNO3FdRFuR3qHeM/iSd/ZwYL/hhJRimn6dZF8z+/abE5TEOBoW7siOEejoQBpvuFQDzfxPKz5xqjaaILl7ypyJxccq9mITgxZtVCB6a7ATsg+b9dnHLXf+JtMfaCxLwsksBEFOracqw0ipQ1z/NrA+vyxbiedO9pA/hKsAZM5LguSE/BPHz4kUOeMMdy6tTf013spbDTMgLlfPO+HbESQ7dJCYjymyDsMX8uLH13vusPwBVd9dPeMRWwtD9dYcfCNdlSGTNPHprf4xwGZ6KcqLLk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2616005)(66476007)(66556008)(6916009)(316002)(66946007)(66899024)(41300700001)(1076003)(33656002)(6512007)(26005)(66574015)(36756003)(6506007)(478600001)(6486002)(38100700002)(86362001)(83380400001)(2906002)(4326008)(8936002)(8676002)(5660300002)(27376004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MUGlznT3PG3XUze6u9e1ejeqcmo2YTrA+h14GcF3tLMy3u+WYDlReOA/YNU1?=
 =?us-ascii?Q?3IAMO3H2kwjgbH6nUMfmWnsv4LGJtv3e9EOmdEfMtPIGqLS9NCEVu82J/ILf?=
 =?us-ascii?Q?ykvOJQlUEwr45lRUTLximKSx1rGW5/UJ6PgcsqXzCxJUBcEa5p89SpZVgw3t?=
 =?us-ascii?Q?iVJmEkfBIoGO7qcc6PObndB9YscDwMFSNZoit/tdd3VuTXO3D4HPImTpOmrt?=
 =?us-ascii?Q?Y0BwujB8TFzFncLXFOiRtsKC0mKygVpJfYeOubCXvAplOZiOdqwwpUveItU+?=
 =?us-ascii?Q?L+GBeXaaZMpP8OWUtMSzN0jS0irU9SOYZMtwzOmH+MUPNKMXcJf8ohHkkE2j?=
 =?us-ascii?Q?yTtxQKCoYyn0SGb5GPu9mS95JuCzyDzxcGNmGRYRg1qplKZyAX851tJI3048?=
 =?us-ascii?Q?z3YmmbgPH/+3hxHUzJwl/y6XDmho6xhLaR5NMmzkKpu9kciDB/WH5nNE6mqD?=
 =?us-ascii?Q?HpcyR+6OLkO87ShuLUMp/cAQbEACaqzAkBN9Nzye1J3cYKUyVc8A3aHU5qZP?=
 =?us-ascii?Q?fygZduaZZBgViuKI+MiP4XuwG7igAy3wlyPnLRMOj/FIincRpmaDvgm9LnJ0?=
 =?us-ascii?Q?XM8pJp8Y+45xKCEPZXdkeZPwGFhMjDzBrTMtE7XmMTz2cZQTXxrp7qSDH76i?=
 =?us-ascii?Q?3Ked3smJxB3F5K5huD19F7rf4cFFS8bSEQDf7IEPn30Nvsz4JciUsjPzE1wi?=
 =?us-ascii?Q?QH+S8yeSkNMvF1qAjTV5w35tj/4s47SS3jCAeACIa1AWyO0h7wGG4eJZd+3O?=
 =?us-ascii?Q?t53MclrrmmjKriYlLPHoavKZYlhkaUaW4WGOn3NRLgR1z+Tz+BoTmNCHxZl3?=
 =?us-ascii?Q?nnH0Qtw2q7R+tRIncXn4oE5oC/ppzspyAeFWIp5Cq4deRVW8ROQb4/VFUr2F?=
 =?us-ascii?Q?LG1pqCgEYiyjPDEmYl4A+99xpEEXFMUaBI0ADvmaY3/6mLaV3wV1m3+euDrn?=
 =?us-ascii?Q?00jkEkmlcFjcSWLkDM/5EUgOhhOJ89WK4d7HEddsIq4/iubcI65U5d2Z1JeF?=
 =?us-ascii?Q?ltQW/NlG+V+R5+WTKwsfI0rnAAmA0gdV3GOZdoGDKABh9lye76rU0WGPnZXy?=
 =?us-ascii?Q?9I50qGRhAb+xRmUwOAYavzT/aD1QMmjpjlmjV17OmUf0ZhRSInP0asSuWKKk?=
 =?us-ascii?Q?B6QYLhuHA7TT1uFUA3aYbROSbtbCXazP5iCPVRmyuqhuryuobvcfpszLUkMi?=
 =?us-ascii?Q?hhMgsgZcdTgxa1AuADNM4O+9iwD6AyrzYo3ss80uU8CNwd7wG2Lzxb0jiRy3?=
 =?us-ascii?Q?VwaMsxghhL3jZthWfnYeTv1b04hdEYoPX+Q+ipoCcli1+oYbdZCssQJYyjS2?=
 =?us-ascii?Q?z6YrUcmgmhlXg5P5NnluDhsIvIKUrw/vYW6wPLIbm0o2Vq1Nj60GKUUBjLnd?=
 =?us-ascii?Q?eDCQ09iFFNPEBrioQh53uwxNfGc5uPOlXLwlExSe+9iIS7x2I+MIoIC4HTVN?=
 =?us-ascii?Q?bqVTdYG3OIKlUT6IwzbwPiAERyPyvQBM0Sg9g58mE2IkZ865/xib2uR5qyoj?=
 =?us-ascii?Q?A1c8V/HBeRO1Z0gASAg9tHX8CdNmsH6xo0BbmPe0gKGiK8f4BSEn0bjsk2xM?=
 =?us-ascii?Q?j/Mw8e/GOaqyxQr1y9SjztW7CioQx83BZEPpcwTQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa23d718-bd5d-4d92-c2c5-08dbc5ce16fe
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 18:08:34.7568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBFkpoa1H4AJ1cmvFFzs0DVYZRz7nkBjtXPoalocEX+Y7l3p/uXhyDnBrlTPdSSJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6226

On Wed, Sep 20, 2023 at 04:45:56PM +0100, Mark Brown wrote:
> On Tue, Sep 19, 2023 at 12:10:01PM -0400, Steven Rostedt wrote:
> 
> > The problem is that there's been no replacement for the maintainer to
> > release their frustration.
> 
> ...
> 
> > I brought up to the TAB a suggestion of starting basically a "Maintainer's
> > support group". A place a maintainer, or even a submitter can go to when
> > they are feeling frustrated. This is not a replacement for the Code of
> > Conduct committee. This is more of a preventive measure. Ideally, the Code
> > of Conduct committee members should be very bored where there are no
> > submitted reports.  That would mean our community is running in a very
> > smooth way. But that's currently not the case. There's been a few cases
> > that have come up where if the maintainer had someone to vent to, it could
> > have prevented the violation of the Code of Conduct.
> 
> ...
> 
> > When a maintainer is getting frustrated with a submitter or another
> > maintainer, or even a submitter is getting frustrated with a maintainer,
> > they would have a place to find a list of people that can help. They would
> > pick one of the people and send an email to them with a subject of
> > "[MAINTAINER SUPPORT]" (or something like that). This would let the
> > supporting maintainer know that this email is about support and should be
> > confidential and follow the guidelines. The email will include who and why
> > they are frustrated with the other person. Again, this is *not* a Code of
> > Conduct issue. This is not to point blame, just frustration. Sometimes
> > people just can not work with other people. The supporting maintainer can
> > be an outside POV and can possibly help with explaining why the other
> > person is acting the way they are. Or the supporting maintainer can find
> > another maintainer to work with this person.
> 
> I think this is a really good idea, and I do think the bit about
> submitters also getting frustrated with maintainers is important here -
> there's a lot of "the process isn't working well" about this stuff which
> will apply just as much to submitters.  It's going to be more obvious to
> us as maintainers that there's issues for maintainers, and in general
> submitters have more valves for releasing frustration (eg, for a lot of
> them it's easy to just walk away, though that's not true for everyone).

Yes, I think this is very true. I've seen a number of cases now where
experienced valuable people in submitter roles just walk away. No
explosion, no LWN article, but our community definitively lost
something of value. [*]

It would be nice to stop talking about this in terms of sides and
focus on the submitter/maintainer relationship as a whole. The issues
I'm aware of are not CoC violations, but nevertheless they have upset
people. There are a whole host of behaviors sumitters/maintainers can
choose to do that range hurtful to non-productive.

I think the fact is there are not really any good release valves. We
can chat amung little groups how situation XYZ is troubled but, unless
it is really critical, the default response I see is to not rock the
boat. Especially if you are on the submitter side - raising a
complaint risks retribution.

A safe space to resolve issues without fear of retribution would be
nice, but is probably unrealistic.

I don't want to be a downer but I've chatted with a enough people now
to say that things seem to be getting worse - it *feels* worse to
participate these days. eg I just finished a nice big series for
something outside the areas I maintain and I'm dreading the process of
merging it :\ Then I think: I wonder if people feel the same way about
my areas? No idea, nobody says.

Maybe I need [MAINTAINER SUPPORT] therapy already.

* - I think we lack quality submitters and that is a big contributor
to stress on the relationship as a whole. So I lament every time I see
a good person walk away.

Regards,
Jason

