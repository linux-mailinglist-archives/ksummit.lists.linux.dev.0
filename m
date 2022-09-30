Return-Path: <ksummit+bounces-816-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1502C5F13A5
	for <lists@lfdr.de>; Fri, 30 Sep 2022 22:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5FAD1C209D4
	for <lists@lfdr.de>; Fri, 30 Sep 2022 20:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56655A99;
	Fri, 30 Sep 2022 20:29:23 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE4B5A88;
	Fri, 30 Sep 2022 20:29:21 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oeMdD-0002Kj-6J; Fri, 30 Sep 2022 22:29:11 +0200
Message-ID: <3a036077-2cad-45c5-c5a3-9f4cb3288b69@leemhuis.info>
Date: Fri, 30 Sep 2022 22:29:08 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US, de-DE
To: Randy Dunlap <rdunlap@infradead.org>, "Luck, Tony" <tony.luck@intel.com>,
 "Bird, Tim" <Tim.Bird@sony.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 <5c6a16c6-f762-9fcf-714e-3dd98137c556@infradead.org>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
In-Reply-To: <5c6a16c6-f762-9fcf-714e-3dd98137c556@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1664569761;79702e7a;
X-HE-SMSGID: 1oeMdD-0002Kj-6J

On 30.09.22 22:04, Randy Dunlap wrote:
> 
> 
> On 9/30/22 10:28, Luck, Tony wrote:
>>> E-mails sent from a web interface could have as much structure as you'd like.
>>> So one avenue would be to set up a nice interface for bug reporting, that just
>>> delivered the form data in e-mail format to the proposed bug-receiving mail list.
>>
>> Web interfaces have the advantage that they can be full of boxes which indicate
>> useful details to supply. Like what kernel version? Did this work on an older version,
>> is so, which one? Which CPU vendor/model are you using? Is there an error message?
>> Are there warnings in the console log before the error? Can you upload a full console log?
>> Does this happen repeatably? What are the steps to reproduce?
>>
>> Etc.etc.
> 
> We have Documentation for all of that, but (a) people don't read documentation
> and/or (b) it's too longwinded (not brief).

Yup. But as the one that is partly (mainly?) responsible for "(b)",
please allow me to quote the last sentence of reporting-issues.rst here:

"""The main author of this text hopes documenting the state of the art
will lay some groundwork to improve the situation over time."""

IOW: I really hope we over time can shorten that text somewhat (or even
a lot?) by...

* making some things a lot easier that currently are unnecessarily hard

* hiding some things in a reporting app or something like that (ideally
usable on the web and locally) that only bothers reporters with tainted
status, bisection, decoding of stack-traces, and things like that if
they are relevant in the particular case

Ciao, Thorsten

