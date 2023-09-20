Return-Path: <ksummit+bounces-1180-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 912117A8D2A
	for <lists@lfdr.de>; Wed, 20 Sep 2023 21:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 808FB281B2B
	for <lists@lfdr.de>; Wed, 20 Sep 2023 19:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEA1405D6;
	Wed, 20 Sep 2023 19:52:43 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D35405CD
	for <ksummit@lists.linux.dev>; Wed, 20 Sep 2023 19:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22DDDC433C7;
	Wed, 20 Sep 2023 19:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695239562;
	bh=Axl6hWaVlkItjCeLpwDlrtUOWPQ0nK/1DbVZ5arkDeA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VL2ng5o/Pyx4m99qKfcRq72cub5KLCzjb2KEC5tr33S73sVkIeLTAkxTltfW4B9hH
	 glWPaTBzzHsN2Zol94jr5QnWTn45F7GMK54uiVgjYgxbW2bMD//RgW01QCqmuBLWkI
	 1FOc5UFPsbFfJtwAQgPG6VfyTeDzFb7XdpwPX0w6o97PvL/IoI9vp3gXIAjR3yw3Nd
	 RKx4sXFaQBLSNltO++JyWwsFyYYZRKCqoDDOaR+iG6Z9ZwrGYy7/o6oa2D0i0WPNN3
	 hrvRMIeAVVI2C70Ls0uTWageCosEWHmniOXM5L7upccVNmtDBhQg+IWIeuugsJPuWv
	 iazZehtkBTb8A==
Message-ID: <57b53325-3c40-641e-30de-5755650960f8@kernel.org>
Date: Wed, 20 Sep 2023 13:52:19 -0600
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [MAINTAINERS SUMMIT] Maintainers Support Group
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Bart Van Assche <bvanassche@acm.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 ksummit@lists.linux.dev, tech-board-discuss@lists.linux-foundation.org,
 shuah <shuah@kernel.org>
References: <20230919121001.7bc610d4@gandalf.local.home>
 <dbeb5ad9-fa6d-4633-a160-6a0f8ed6bd51@acm.org>
 <20230919132112.19b700df@gandalf.local.home>
 <496f0b46-1a40-af25-ac1a-d4e7f1a8aad0@kernel.org>
 <20230919192148.1010cc74@gandalf.local.home>
From: Shuah <shuah@kernel.org>
In-Reply-To: <20230919192148.1010cc74@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/23 17:21, Steven Rostedt wrote:
> On Tue, 19 Sep 2023 16:55:29 -0600
> Shuah <shuah@kernel.org> wrote:
> 
>> As I replied to Ted and Randy, I think the proposal James pointed to is
>> where we could start and evolve that discussion to the actions such as
>> support group, instead of starting with a solution without looking at
>> the bigger picture.
>>
>> https://lore.kernel.org/ksummit/ab9cfd857e32635f626a906410ad95877a22f0db.camel@HansenPartnership.com/
> 
> I saw this when James first posted it. I may have been the lone figure to
> do so as I had to point it out when the topic came up a second time ;-)
> 
>    https://lore.kernel.org/all/20230817104622.511c61b4@gandalf.local.home/
> 
> I'm all for having this discussion under James topic, but this idea of a
> Support Group is something I've been discussing with other maintainers for
> some time. I believe I even mentioned it to you while on the bus in Dublin.
> 
Thank you. Yes. We talked about this last year at Dublin. Work of being an
Open source developer and especially a maintainer demands emotional labor.
This is definitely a risk factor for burnout.

I happened to com across an article today about burnout risk factors and some
of those are faced by maintainers and developers. If you are interested, I can
send the link.

> One of the things the TAB is working on is to come up with a "Communication
> Style" document that will be focused on how submitters should speak to
> maintainers and how maintainers should speak to submitters. The idea is to
> help people understand the POV that others are coming from. But that's a
> discussion for another day.
> 

Formalizing the communication is a good idea - I keep translating maintainer
and developer speak to new developers I mentor often enough to see the value
of such an effort. :)

> Anyway, with the majority of the [MAINTAINERS SUMMIT] submissions related
> to this, I think it should definitely be discussed at the maintainers
> summit.
> 

I would recommend discussion this prior to the Maintainer summit in an open
session to get input from developers and maintainers who aren't invited to
the maintainers summit myself included.

thanks,
-- Shuah


