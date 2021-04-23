Return-Path: <ksummit+bounces-131-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 9866D3689AA
	for <lists@lfdr.de>; Fri, 23 Apr 2021 02:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id AE9A33E8630
	for <lists@lfdr.de>; Fri, 23 Apr 2021 00:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCDD2FA2;
	Fri, 23 Apr 2021 00:10:16 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132B170
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 00:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=b658WO1cfkCzmniAQjbswqvEqiD20keA/c2Qdz3GX3M=; b=ED+wcWFYWZLq2ifP7AnHRSdw9v
	8cr6F7CaTXfrbXJtDM0qyZuVQ5H4dmJa7iAxd3hDTueAXbtz6SVh3p5a1p1NSTInNtNCC4/5E7gwR
	BjPpaR+G4/3qazqCllpAllMZ8U3QdpApjvSTaFLFezipZl/ZSnmEsA8Udqu2H7hLRLmb8nH8lvpyG
	r9MKOVJLXVVFBv6dcDfCwEQoqq+rGfFJoQVBk+5NnQy4DAIP5VGDH+hgTPTSOGwSk4z3D/mtYlNf4
	80WNRDUNqgWjqZbLQ5TAaF86TzvimK5eQX17jOioU1cEHrIkCbgbLvznkoSv30vrcRtoZEnzh/pvY
	h++ujD8g==;
Received: from [2601:1c0:6280:3f0::df68]
	by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1lZjO0-001AYY-2K; Fri, 23 Apr 2021 00:09:40 +0000
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 ksummit@lists.linux.dev
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210421194702.GH1981@kadam> <20210422113404.09f35a85@coco.lan>
 <68c628ed354ea1ddea81878f0d713d2ce6426126.camel@sipsolutions.net>
 <YIHZY1oWNRLOCtQa@piout.net>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <bf59ed57-376d-785b-3c93-ed5f30d3846a@infradead.org>
Date: Thu, 22 Apr 2021 17:09:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YIHZY1oWNRLOCtQa@piout.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/22/21 1:15 PM, Alexandre Belloni wrote:
> On 22/04/2021 11:59:38+0200, Johannes Berg wrote:
>> On Thu, 2021-04-22 at 11:34 +0200, Mauro Carvalho Chehab wrote:
>>>
>>> Here, I use "wdiff" in order to deal with renames. It has a somewhat
>>> funny dialect, but it helps a lot reviewing renaming patches.
>>
>> This also helps for casual "git show" etc.:
>>
>> [core]
>> 	pager = /usr/share/git-core/contrib/diff-highlight | less -RFX
>>
>> (path may vary, of course)
>>
> 
> I've been shown https://github.com/dandavison/delta/ a little while ago
> and it has a very good side by side view, showing exactly what change on
> each line. I'm using:
> 
> [core]
>         pager = delta
> [delta]
>         plus-color = "#012800"
>         minus-color = "#340001"
>         syntax-theme = Solarized (light)
>         line-numbers = true
>         side-by-side = true
> 

If anyone is into a similar(?) (non-git) old school solution, you can try
patchview:  https://www.infradead.org/~rdunlap/scripts/patchview

It might be nice to have an "ignore whitespace" option...

-- 
~Randy


