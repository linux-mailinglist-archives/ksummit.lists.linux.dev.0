Return-Path: <ksummit+bounces-1174-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6707A6EE0
	for <lists@lfdr.de>; Wed, 20 Sep 2023 00:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80B99281953
	for <lists@lfdr.de>; Tue, 19 Sep 2023 22:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A879339A7;
	Tue, 19 Sep 2023 22:55:31 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B6B46A1
	for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 22:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20476C433C8;
	Tue, 19 Sep 2023 22:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695164130;
	bh=HzT1OSCZW9CzitLoYclkk2CsaXnG3F4avUDlIFAVXn0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CPwKam6z6hOAHt9fPj74OKH3Datrkv47s//qh5HnsLndhO4+iFIgtl/ez7o0TQawe
	 ZkfajL1Ci97FnnlAwzZAY0duCi+jjeQJQkEscbhsMbZkeU+yLrMmSUeVp957XF81Oi
	 jzZQvNwIh6AXVUnJ6GjFN59Ofkrn1FvT5rVWntPYR2UoqNzZsyAzo/DMuFyabH2Ofq
	 IlnXx4gmJe751nxKVl9bMH6DxH4Y2zDwYEBXOoQbEE/f/zIkGzp4r31nVj1y43b2eV
	 BPFVSIE5qo0T1rVfEC3V7spy0h+IE0bmQi25RWoBX/xc4WMYcW0gvkSgTgufoxOJMr
	 h1PMq3CQD6HtQ==
Message-ID: <496f0b46-1a40-af25-ac1a-d4e7f1a8aad0@kernel.org>
Date: Tue, 19 Sep 2023 16:55:29 -0600
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
To: Steven Rostedt <rostedt@goodmis.org>, Bart Van Assche
 <bvanassche@acm.org>, James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: ksummit@lists.linux.dev, tech-board-discuss@lists.linux-foundation.org,
 shuah <shuah@kernel.org>
References: <20230919121001.7bc610d4@gandalf.local.home>
 <dbeb5ad9-fa6d-4633-a160-6a0f8ed6bd51@acm.org>
 <20230919132112.19b700df@gandalf.local.home>
From: Shuah <shuah@kernel.org>
In-Reply-To: <20230919132112.19b700df@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/23 11:21, Steven Rostedt wrote:
> On Tue, 19 Sep 2023 10:03:48 -0700
> Bart Van Assche <bvanassche@acm.org> wrote:
> 
>> On 9/19/23 09:10, Steven Rostedt wrote:
>>> Thoughts?
>>
>> Maybe maintainers who are stressed out will prefer a video call or IRC
>> session instead of sending an email that gets archived who-knows-where?
> 
> As I replied to Shuah. There would be no mailing list. And the names of the
> supporting volunteers will be listed. Sure, we can include irc contacts of
> how to reach those maintainers if they choose.
> 

Steve,

As I replied to Ted and Randy, I think the proposal James pointed to is
where we could start and evolve that discussion to the actions such as
support group, instead of starting with a solution without looking at
the bigger picture.

https://lore.kernel.org/ksummit/ab9cfd857e32635f626a906410ad95877a22f0db.camel@HansenPartnership.com/

thanks,
-- Shuah

