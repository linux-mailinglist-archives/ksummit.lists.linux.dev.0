Return-Path: <ksummit+bounces-2691-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEEDCFFCA0
	for <lists@lfdr.de>; Wed, 07 Jan 2026 20:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C981306A0A3
	for <lists@lfdr.de>; Wed,  7 Jan 2026 19:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898433385A3;
	Wed,  7 Jan 2026 19:27:41 +0000 (UTC)
Received: from blackbird.sr71.net (blackbird.sr71.net [198.145.64.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E344F329C7C
	for <ksummit@lists.linux.dev>; Wed,  7 Jan 2026 19:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.145.64.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767814059; cv=none; b=qXW3bdQNNpAnAYA99jv9Lp8B2lNCWeAqPqk2lbvtEofTH4XIjJDkxrh2oYDqSnI07vRhO1I7L+GiQuuQFoT+a277oWx8O80r6SNNAyMmOSNTC/864dgWKY4+wlzaQOploR3HJQIK6t2JItBALv5r03dT52EP6VXm4hZDrVc+0MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767814059; c=relaxed/simple;
	bh=GP1kERezwgCJjXzsmCvZUaQdR75nXG7OB8oceRHDReI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AtiMA8Rcz58rYQpOEIX3rYloTYBZvndhbZtknIiwEPy9F5qOM79ai9SeWXfuIVre9KRALfHCsXU+dQqKv9tXp3DjcJ5stKqPPHX5Ehfos3mqRKnzeTtosvwOZfYgEdqXkI/kSPFofOEiAGU25psBSW7hIv5g3Bo0jZ/wze75a/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sr71.net; spf=pass smtp.mailfrom=sr71.net; arc=none smtp.client-ip=198.145.64.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sr71.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sr71.net
Received: from [0.0.0.0] (unknown [134.134.137.72])
	(Authenticated sender: dave)
	by blackbird.sr71.net (Postfix) with ESMTPSA id 7A3C8201BA;
	Wed,  7 Jan 2026 11:18:53 -0800 (PST)
Message-ID: <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
Date: Wed, 7 Jan 2026 11:18:52 -0800
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated
 content
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Steven Rostedt
 <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>,
 Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
 workflows@vger.kernel.org, ksummit@lists.linux.dev
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
From: Dave Hansen <dave@sr71.net>
Content-Language: en-US
In-Reply-To: <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/7/26 10:12, Lorenzo Stoakes wrote:
...
> I know Linus had the cute interpretation of it 'just being another tool'
> but never before have people been able to do this.

I respect your position here. But I'm not sure how to reconcile:

	LLMs are just another tool
and
	LLMs are not just another tool

:)

Let's look at it another way: What we all *want* for the kernel is
simplicity. Simple rules, simple documentation, simple code. The
simplest way to deal with the LLM onslaught is to pray that our existing
rules will suffice.

For now, I think the existing rules are holding. We have the luxury of
treating LLMs like any other tool. That could change any day because
some new tool comes along that's better at spamming patches at us. I
think that's the point you're trying to make is that the dam might break
any day and we should be prepared for it.

Is that what it boils down to?

>> +As with all contributions, individual maintainers have discretion to
>> +choose how they handle the contribution. For example, they might:
>> +
>> + - Treat it just like any other contribution.
>> + - Reject it outright.
> 
> This is really not correct, it's simply not acceptable in the community to
> reject series outright without justification. Yes perhaps people do that,
> but it's really not something that's accepted.

I'm not quite sure how this gives maintainers a new ability to reject
things without justification, or encourages them to reject
tool-generated code in a new way.

Let's say something generated by "checkpatch.pl --fix" that's trying to
patch arch/x86/foo.c lands in my inbox. I personally think it's OK for
me as a maintainer to say: "No thanks, checkpatch has burned me too many
times in foo.c and I don't trust its output there." To me, that's
rejecting it outright.

Could you explain a bit how this might encourage bad maintainer behavior?

