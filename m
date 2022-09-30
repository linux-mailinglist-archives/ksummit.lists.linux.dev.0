Return-Path: <ksummit+bounces-815-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D93F15F131C
	for <lists@lfdr.de>; Fri, 30 Sep 2022 22:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D377280D14
	for <lists@lfdr.de>; Fri, 30 Sep 2022 20:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640AD5A97;
	Fri, 30 Sep 2022 20:05:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8F05A88;
	Fri, 30 Sep 2022 20:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=gxAcXgV1LDV4vzBWpZ/qZt853xhT17W2/uV47tPaqec=; b=LI64qn7u3WVEHhykrURq5oQUi+
	RZjHefVco06xCFv3XqVdv3rbhN4RFM2YjOHvpeQVpRwO/TpyyWNokGebc34K9/A2S6MLkOgVbBb8f
	THhsbGenA+GcI6tkk55Bfb80Td5OUHDX2QVd2QLPmA3uus44kVsvhDye7aAhv6AZ4c1p8xd0W9+sM
	oVpClL97m5g22SEbDskOTRk+QcXcw4o/A7f7VSlrFEYeyVPaR6RpRuqc5q/3Mk8goImg5Ji6NFqzk
	Ni4POOTDsF50Y8tMtcRJk/IrZ1BQfI9pqiCKp6ZE83gYNQnZ06SLObfSp/Qc2lQe1mBPvHzVgtOKb
	hgibOMzg==;
Received: from [2601:1c2:d80:3110::a2e7]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeMFN-00BJGq-Vv; Fri, 30 Sep 2022 20:04:34 +0000
Message-ID: <5c6a16c6-f762-9fcf-714e-3dd98137c556@infradead.org>
Date: Fri, 30 Sep 2022 13:04:30 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Content-Language: en-US
To: "Luck, Tony" <tony.luck@intel.com>, "Bird, Tim" <Tim.Bird@sony.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thorsten Leemhuis <linux@leemhuis.info>
Cc: Slade Watkins <srw@sladewatkins.net>, "Artem S. Tashkinov"
 <aros@gmx.com>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 "workflows@vger.kernel.org" <workflows@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Torvalds, Linus" <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <93a37d72-9a88-2eec-5125-9db3d67f5b65@gmx.com>
 <20220929130410.hxtmwmoogzkwcey7@meerkat.local>
 <7b427b41-9446-063d-3161-e43eb2e353f9@gmx.com>
 <20220929135325.4riz4ijva2vc7q5p@meerkat.local>
 <95c3384b-53d0-fd6c-6ec5-a7e03fdeddfc@gmx.com>
 <F300ED64-5E8E-4060-89DC-C98BC5FF08E6@sladewatkins.net>
 <YzXK6Px+BrNuuMZH@pendragon.ideasonboard.com>
 <a86adc6d-05db-ec2e-c5de-d280aad9fb8a@leemhuis.info>
 <Yzbtuz6L1jlDCf9/@pendragon.ideasonboard.com>
 <BYAPR13MB250377AAFCC43AC34E244795FD569@BYAPR13MB2503.namprd13.prod.outlook.com>
 <SJ1PR11MB60836F8B9E045C5542D01ADAFC569@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <SJ1PR11MB60836F8B9E045C5542D01ADAFC569@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/30/22 10:28, Luck, Tony wrote:
>> E-mails sent from a web interface could have as much structure as you'd like.
>> So one avenue would be to set up a nice interface for bug reporting, that just
>> delivered the form data in e-mail format to the proposed bug-receiving mail list.
> 
> Web interfaces have the advantage that they can be full of boxes which indicate
> useful details to supply. Like what kernel version? Did this work on an older version,
> is so, which one? Which CPU vendor/model are you using? Is there an error message?
> Are there warnings in the console log before the error? Can you upload a full console log?
> Does this happen repeatably? What are the steps to reproduce?
> 
> Etc.etc.

We have Documentation for all of that, but (a) people don't read documentation
and/or (b) it's too longwinded (not brief).

> Sometimes it takes a few round trips by e-mail to establish the baseline facts.

Ack.

-- 
~Randy

