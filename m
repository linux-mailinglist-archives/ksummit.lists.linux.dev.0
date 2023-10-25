Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 078D17D7788
	for <lists@lfdr.de>; Thu, 26 Oct 2023 00:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3774D1C20E80
	for <lists@lfdr.de>; Wed, 25 Oct 2023 22:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4061437159;
	Wed, 25 Oct 2023 22:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="4uAFj/pj"
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40081401F;
	Wed, 25 Oct 2023 22:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=UJ4YSQEoarmGJufwe7uM+Jd9pWRnWY1wsyNnjbOiVAk=; b=4uAFj/pj/xypwcOUBGnk8I+E2w
	00CNiuXc5CBSzDNJ24MvWmnTplAAJWWXe37el1adJHuzbtGo5jKD7PteGdTbJ9kJJ86ltbVBFRbNV
	NITvyh+ByEM3mXeRt6h8Y/RDhWEvisepKXTHLrqZ8yrzGZPCgV01hWBv+RF+Y8Puu3X+vsx9FAgK4
	CW2V3bW+QFZrYA1JgkeJ+6lUZQDp2Pqk24rub/qPz5gX0zcrs6HOMDud+Vq8OCZ+2X7emW8KTYWIl
	mKjC1VT4ensKJc2bYm0KGVtKLjjvydzt39CHBzxRKv17/301BprbYqzy+GZ1vz1io/nvn9cyS7JvR
	gPRdutvg==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qvluz-00DDc8-37;
	Wed, 25 Oct 2023 22:00:02 +0000
Message-ID: <81685f3d-b130-4c09-a29e-56cc5235ac25@infradead.org>
Date: Wed, 25 Oct 2023 15:00:01 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KTODO automated TODO lists
Content-Language: en-US
To: NeilBrown <neilb@suse.de>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
 outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
 <169818295461.20306.14022136719064683486@noble.neil.brown.name>
 <CAMuHMdXaSv3w0iAJBZ_8PrjMV=A2neZ0a72XbqftxrYVJyCzsA@mail.gmail.com>
 <169826846576.20306.981035382886610843@noble.neil.brown.name>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <169826846576.20306.981035382886610843@noble.neil.brown.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/25/23 14:14, NeilBrown wrote:
> On Wed, 25 Oct 2023, Geert Uytterhoeven wrote:
>> Hi Neil,
>>
>> On Tue, Oct 24, 2023 at 11:29 PM NeilBrown <neilb@suse.de> wrote:
>>> On Wed, 25 Oct 2023, Krzysztof Kozlowski wrote:
>>>> On 23/10/2023 20:49, Andrew Morton wrote:
>>>>> On Thu, 19 Oct 2023 07:11:36 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:
>>>>>> Yesterday someone on my lists just sent an email looking for kernel
>>>>>> tasks.
>>>>>
>>>>> Well here's a task: write a bot which follows the mailing lists and
>>>>> sends people nastygrams if one of their emails is more than 95%(?)
>>>>> quoted text.
>>>>>
>>>>> It's happening significantly more lately.  Possibly because the gmail
>>>>> client helpfully hides quoted text.
>>>>
>>>> I would also point to reviewers and maintainers who give a Rb/Ack tag:
>>>> 1. somewhere at the top, without any footer like Best regards, and then
>>>> quote entire patch, so I don't know shall I look for more comments after
>>>> Rb/Ack?
>>>>
>>>> 2. quote entire email and then add Rb/Ack, so I need to figure out
>>>> whether there was something between the hundreds of lines of text or not.
>>>
>>> Here we all are, brilliantly talented computer programmers who spend
>>> our days making amazing fast digital devices do amazingly clever and
>>> subtle things, inventing time-saving tools and processing vast amounts
>>> of data without blinking, but for some reason we think the task of
>>> skipping over a few thousand lines that all start with '> " is too hard
>>> for us and that we should, in stead, complain to some other human to
>>> convince them to make our life easier for us.
>>>
>>> Does anyone else see the irony?
>>
>> Please compare the numbers:
>>   1. 1 sender removes irrelevant parts,
>>   2. N receivers skip irrelevant parts.
> 
> That is one way to look at the numbers.
> Another is:
> 
>   12 - fix about a dozen MUAs to summaries quotes properly
>   12000 - fix an unknownable number of people to quote just exactly the
>           amount that their particular audience is going to want
> 
> and when it comes to fixing-code versus fixing-people, I know which this
> community is better at.
> 
> I guess there is also the option
> 
>    1 - fix vger.kernel.org to reject postings from people who don't
>         think and quote like "us", because we already have too many
>         contributor and want to block the heretics
> 
> This is really just a form of the "platform problem" which lwn.net has
> occasionally written about.  The "problem" is that we treat the platform
> (library code or other infrastructure) as fixed and develop ugly hacks
> in our own code to work around some shortcoming, rather the going into
> the platform and fixing it once for everyone there.

The problem AFAICT is that many (most?) of us expect a certain level of
etiquette but we are not seeing it in some posts.

-- 
~Randy

