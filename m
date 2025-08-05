Return-Path: <ksummit+bounces-2063-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DA6B1B9E1
	for <lists@lfdr.de>; Tue,  5 Aug 2025 20:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21177189DAEE
	for <lists@lfdr.de>; Tue,  5 Aug 2025 18:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1271C860E;
	Tue,  5 Aug 2025 18:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8J2sDIK"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B3119E98C
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 18:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754417781; cv=none; b=WnvW21EcIBKW8oe2FJANhRFxuHFz0C/c7YMMa2UeIaEm8oNjOp6rymZQVUct0t1FQpNbYjZj/I20a2bjQqMN5oWbXzp84OQgy8zNgc4ldY86eF17cFDzuYvxJU5mJTN5AS+a5ckMTari5RTJNgr7Pp0eGMTjBXlZDSdLT4vdi/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754417781; c=relaxed/simple;
	bh=/Nnh13ouTbTJ4SlbOXez3b16FUsF1ioC+Sqseu+/0h0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6Ctv8FFs/XiLy9b06dJ2sQ5N+Mhwz7+P+U59w20+Ja9cNiWmnkKhciGHxrJVPHjXZeMW56Khu6P7IbpoyQdaE8CUQUWdrhBGdYbRVNCzPAaaxNYZx0AYFmgUmOG21WBk8EjMM88zKttus3J4sjEfc2d1BdKZ6r+Cfwfw6gOOb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8J2sDIK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88B8C4CEF0;
	Tue,  5 Aug 2025 18:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754417780;
	bh=/Nnh13ouTbTJ4SlbOXez3b16FUsF1ioC+Sqseu+/0h0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T8J2sDIK2ycmsI3rKcbb/lzPagp1BuHeGsh1xyLCdn5aLNF/+yKXyY5F8xkjdoE4V
	 C6BvUNZD9Y6KCjCs63E/fxZhMxDrorL/SxGrQmsPJ6l3QU6WhxVnM6iq1VTdBdAv+0
	 CXSVPUUQTGkxD456djonqPWC3wDcV2VHn6Oz8c4/HwT/yqZpaLdqTUHjsjV5vnlnUv
	 EotYt5OfiOgszBYdUPGGQEyLgEnNOV+BlcBCBvUD3oV5HGqTy8+L4rbntowuPWbCrD
	 +nc17/2jH+kjxmI4NCpPYTBMSR26blPcG9ROGJgl3fVNhqxvL+6QU4SmwbD5bhhyzn
	 KLOWc/21MwVLg==
Date: Tue, 5 Aug 2025 14:16:17 -0400
From: Sasha Levin <sashal@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <aJJKccsn_L0hGXoA@lappy>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <20250805180010.GA24856@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250805180010.GA24856@pendragon.ideasonboard.com>

On Tue, Aug 05, 2025 at 09:00:10PM +0300, Laurent Pinchart wrote:
>On Tue, Aug 05, 2025 at 01:50:57PM -0400, Sasha Levin wrote:
>> On Tue, Aug 05, 2025 at 05:38:36PM +0200, Jiri Kosina wrote:
>> >This proposal is pretty much followup/spinoff of the discussion currently
>> >happening on LKML in one of the sub-threads of [1].
>> >
>> >This is not really about legal aspects of AI-generated code and patches, I
>> >believe that'd be handled well handled well by LF, DCO, etc.
>> >
>> >My concern here is more "human to human", as in "if I need to talk to a
>> >human that actually does understand the patch deeply enough, in context,
>> >etc .. who is that?"
>> >
>> >I believe we need to at least settle on (and document) the way how to
>> >express in patch (meta)data:
>> >
>> >- this patch has been assisted by LLM $X
>> >- the human understanding the generated code is $Y
>> >
>> >We might just implicitly assume this to be the first person in the S-O-B
>> >chain (which I personally don't think works for all scenarios, you can
>> >have multiple people working on it, etc), but even in such case I believe
>> >this needs to be clearly documented.
>>
>> The above isn't really an AI problem though.
>>
>> We already have folks sending "checkpatch fixes" which only make code
>> less readable or "syzbot fixes" that shut up the warnings but are
>> completely bogus otherwise.
>>
>> Sure, folks sending "AI fixes" could (will?) be a growing problem, but
>> tackling just the AI side of it is addressing one of the symptoms, not
>> the underlying issue.
>
>Perfect, let's document a policy and kill two birds with one stone then.

So I've gone through some of our docs, and we already have the following
in submitting-patches.rst:

	Your patch will almost certainly get comments from reviewers on
	ways in which the patch can be improved, in the form of a reply
	to your email. You must respond to those comments; ignoring
	reviewers is a good way to get ignored in return. You can simply
	reply to their emails to answer their comments. Review comments
	or questions that do not lead to a code change should almost
	certainly bring about a comment or changelog entry so that the
	next reviewer better understands what is going on.

	Be sure to tell the reviewers what changes you are making and to
	thank them for their time.  Code review is a tiring and
	time-consuming process, and reviewers sometimes get grumpy.
	Even in that case, though, respond politely and address the
	problems they have pointed out.  When sending a next version,
	add a ``patch changelog`` to the cover letter or to individual
	patches explaining difference against previous submission (see
	:ref:`the_canonical_patch_format`).  Notify people that
	commented on your patch about new versions by adding them to the
	patches CC list.

In the context of this discussion it's a bit funny: we mandate that
reviews will be responded to, but we don't mandate that the response
will make any sense, which I think is Jiri's point.

The TIP maintainer's handbook (maintainer-tip.rst) actually seems to
tackle this:

    SOBs after the author SOB are from people handling and transporting
    the patch, but were not involved in development. SOB chains should
    reflect the **real** route a patch took as it was propagated to us,
    with the first SOB entry signalling primary authorship of a single
    author.

Should we clarify that this is true for any kernel patches?

-- 
Thanks,
Sasha

