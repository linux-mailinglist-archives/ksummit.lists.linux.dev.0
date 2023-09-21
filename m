Return-Path: <ksummit+bounces-1182-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2635C7A9039
	for <lists@lfdr.de>; Thu, 21 Sep 2023 02:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6128BB208FB
	for <lists@lfdr.de>; Thu, 21 Sep 2023 00:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30852800;
	Thu, 21 Sep 2023 00:45:49 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF02438E
	for <ksummit@lists.linux.dev>; Thu, 21 Sep 2023 00:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FE8C433C7;
	Thu, 21 Sep 2023 00:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695257148;
	bh=aG4rGN+gyvqEf85GmMV8R6dvOY8eyqKbiB9Ck15srTc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kKG0Hbp9hnwbqiyd7wNoKKIp3QoaaAb9lkp1BBxtLsVWQztmSErJg/A/KW2ySplgb
	 SNuK0MM+pZcoSCRK22DNUN+wDl2I93j0ByYAgHst8LlesERpk/xRM/RDKSVwEIMcJ1
	 4PlrguXgadgBGEN6h0MeE+oDHjM3DQA9i9uHIra0nqWmieUQuqaPsJIWgNcZTk/cDn
	 iBLEhoYrrTXz4dS8Fqt4CbFYJI/mBRF/6KGjd5kkWbNshd29dGyna/7SXlqXnv5woU
	 fiFlNzz8QrhDmKZrF55qVqWk9Iy9f9Dx68IrHCk4L1ORtRCJyLSOH5dDQTxILpRtez
	 VHaKNt2krwuhA==
Message-ID: <38893d55-337e-692d-6eb6-999ae8d515ae@kernel.org>
Date: Wed, 20 Sep 2023 18:45:46 -0600
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
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Bart Van Assche
 <bvanassche@acm.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev,
 tech-board-discuss@lists.linux-foundation.org, shuah <shuah@kernel.org>
References: <20230919121001.7bc610d4@gandalf.local.home>
 <dbeb5ad9-fa6d-4633-a160-6a0f8ed6bd51@acm.org>
 <20230919132112.19b700df@gandalf.local.home>
 <496f0b46-1a40-af25-ac1a-d4e7f1a8aad0@kernel.org>
 <20230919192148.1010cc74@gandalf.local.home>
 <57b53325-3c40-641e-30de-5755650960f8@kernel.org>
 <20230920225441.GA12561@pendragon.ideasonboard.com>
From: Shuah <shuah@kernel.org>
In-Reply-To: <20230920225441.GA12561@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/23 16:54, Laurent Pinchart wrote:
> On Wed, Sep 20, 2023 at 01:52:19PM -0600, Shuah wrote:
>> On 9/19/23 17:21, Steven Rostedt wrote:
>>> On Tue, 19 Sep 2023 16:55:29 -0600 Shuah wrote:
>>>
>>>> As I replied to Ted and Randy, I think the proposal James pointed to is
>>>> where we could start and evolve that discussion to the actions such as
>>>> support group, instead of starting with a solution without looking at
>>>> the bigger picture.
>>>>
>>>> https://lore.kernel.org/ksummit/ab9cfd857e32635f626a906410ad95877a22f0db.camel@HansenPartnership.com/
>>>
>>> I saw this when James first posted it. I may have been the lone figure to
>>> do so as I had to point it out when the topic came up a second time ;-)
>>>
>>>     https://lore.kernel.org/all/20230817104622.511c61b4@gandalf.local.home/
>>>
>>> I'm all for having this discussion under James topic, but this idea of a
>>> Support Group is something I've been discussing with other maintainers for
>>> some time. I believe I even mentioned it to you while on the bus in Dublin.
>>
>> Thank you. Yes. We talked about this last year at Dublin. Work of being an
>> Open source developer and especially a maintainer demands emotional labor.
>> This is definitely a risk factor for burnout.
>>
>> I happened to com across an article today about burnout risk factors and some
>> of those are faced by maintainers and developers. If you are interested, I can
>> send the link.
> 
> Collecting interesting (and hopefully useful) resources is a fairly low
> effort exercise, so I'll start:
> 
> "Negotiating the Nonnegotiable", by Daniel Shapiro
> https://www.penguinrandomhouse.com/books/314284/negotiating-the-nonnegotiable-by-daniel-shapiro/

Adding one I read this morning:
A Burnout Risk Checklist
Know your risk so you can prevent burnout.
https://www.psychologytoday.com/us/blog/lessons-from-a-burnt-out-psychologist/202309/a-burnout-risk-checklist
> 

>> I would recommend discussion this prior to the Maintainer summit in an open
>> session to get input from developers and maintainers who aren't invited to
>> the maintainers summit myself included.
> 
> I wonder if I'm stating the obvious, but trying to figure out ways to
> handle psychological problems in a group made of software developers
> seems like we will be fairly short on essential skills for this kind of
> exercise. Given the size of the affected community, I think we could
> find ways to get professional help.
> 

This discussion would be for coming up with a few solutions including
the one you suggested - "find ways to get professional help".

thanks,
-- Shuah

