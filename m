Return-Path: <ksummit+bounces-2684-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 010D4CDCC17
	for <lists@lfdr.de>; Wed, 24 Dec 2025 16:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93752300C290
	for <lists@lfdr.de>; Wed, 24 Dec 2025 15:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03A4313E22;
	Wed, 24 Dec 2025 15:47:18 +0000 (UTC)
Received: from blackbird.sr71.net (blackbird.sr71.net [198.145.64.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399D3313276
	for <ksummit@lists.linux.dev>; Wed, 24 Dec 2025 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.145.64.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766591237; cv=none; b=ehO/A0f05U/g0oOpBX4CpJZNLIaqTkcvkg9u7NRTT9jSgX28VUVbMGEq78Rl8A5Ep2Ul+0wtNYOxTGA06tCNJD+Y6/jbY2cpsAs3XTwz8b7kUXP0Z8B2uZglqSYCwRMJjFDLARmadh8ccqXGtSHfDN3DIjjrabIPDQQ0LkIFgz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766591237; c=relaxed/simple;
	bh=FWjqVCUt0XGmyJMHnPNUqLufxVIocXL21jU6zKWX3jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJ7SLjT8lQ/wmNxEiAULFXXQgkggjYG0EcmItBPaoGOUMlfVqJrUgs1rrUUsGmX2sNUXw7eTa0aBWt8r8Bll0/lVYgwS3c0qf1x8noFXicLJP41ko1RMXFA447bg8nGJC+QundCpe6E9TZ99b9WuL3tJD4ezIL+Ez+8pGDX3xPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sr71.net; spf=pass smtp.mailfrom=sr71.net; arc=none smtp.client-ip=198.145.64.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sr71.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sr71.net
Received: from [0.0.0.0] (unknown [134.134.139.75])
	(Authenticated sender: dave)
	by blackbird.sr71.net (Postfix) with ESMTPSA id DBD46201D7;
	Wed, 24 Dec 2025 07:41:34 -0800 (PST)
Message-ID: <d0903ed7-e2db-4d8c-ab7f-0beb84760f07@sr71.net>
Date: Wed, 24 Dec 2025 07:41:34 -0800
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated
 content
To: Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kees Cook <kees@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Shuah Khan <shuah@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, NeilBrown <neilb@ownmail.net>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Sasha Levin <sashal@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 workflows@vger.kernel.org, ksummit@lists.linux.dev
References: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
 <20251115140746.6a3acfd5@batman.local.home> <877bvqan70.ffs@tglx>
 <2804290.mvXUDI8C0e@rafael.j.wysocki>
 <EEF974E1-08D5-4E67-8AC4-4315CF9D10C1@kernel.org>
 <20251116111732.5159839e@batman.local.home>
 <2025122358-flyover-tidy-6f4d@gregkh> <87a4z9w2dl.fsf@trenco.lwn.net>
 <20251223155652.7c52630e@gandalf.local.home>
Content-Language: en-US
From: Dave Hansen <dave@sr71.net>
In-Reply-To: <20251223155652.7c52630e@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/23/25 12:56, Steven Rostedt wrote:
>>> What's the status of this patch?  I don't see it in linux-next, is it
>>> supposed to go through some specific tree?  
>> I've been assuming there would be another version after the meeting, so
>> haven't applied anything.  (Besides, between travel, 100mph winds, and
>> several days without power, I've not gotten much done in general...)
>>
> Yeah. I was talking with Dave on the way to the Kill Bill evening event and
> I believe he was planning on doing another version sometime when he got back.
> 
> Dave correct me if I'm wrong.

Yup, I was just waiting to post again until I know I can be attentive to
email and responsive to an reviewers. It's definitely not dropped on the
floor.

