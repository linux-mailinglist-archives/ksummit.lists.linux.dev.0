Return-Path: <ksummit+bounces-2055-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BCEB1B999
	for <lists@lfdr.de>; Tue,  5 Aug 2025 19:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5946189E1AC
	for <lists@lfdr.de>; Tue,  5 Aug 2025 17:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920B1293C58;
	Tue,  5 Aug 2025 17:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pbpFIM5p"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185F321A928
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 17:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754416260; cv=none; b=oUskPmTcho6+cdYcbFAtjdnGCl+hCmTqiEiQo3GEZ1IUbw/D82Tm+BS+NiPaSqI6NnOwXdU73iIB8zJ2TvazDLXrV0KU2iw7+HjslUEYv23LsYWk43fjSgeCVsSm3O/7rFvHL2kflSI7oVuwPfN53M22mLPt+J9EuQ5nwRTtoFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754416260; c=relaxed/simple;
	bh=kY6j/26ElAZZWmWcn0qA7GNC5+eoK64JTPocv/LQcgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BG3uGxy3vQ8c5N3yQixKJHAQ6GGRGYKW9FRFa8ZaljMbilehcDrHwXXRoGJnqUnvJ1Tr0Bz8GfIu0Vqtk+siMwb/32lq7jSOf0q3cYHvo9BF1kbXHL6fweWiNBjY/kFTfSGE30oBZW7uQSH3ItQr578vAJ24RUI/xZDOht6H4H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pbpFIM5p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2882EC4CEF0;
	Tue,  5 Aug 2025 17:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754416259;
	bh=kY6j/26ElAZZWmWcn0qA7GNC5+eoK64JTPocv/LQcgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pbpFIM5pDzzBaNDCScdV9iQaD2eMsI1zwv6rmoTMYAXiR+esduRk1kN69hjp7F6uX
	 rUB6qd0pcBrSmtfzBBi8ATj9Z/3Eug7GjsZEiNFAMk7TqeP6Rqyv8qys39vm59ZHGK
	 UcfZDqmi/p0K4NKRKHlG9gt17M4BpchqT6kGPTNoiurEXmv/Pn132YdBAEWxHyWVM8
	 yR8Igv9PkDd+v9y+uqpSQ2KaIz9fflsdJ0gbSyzz6i1trMeLAPDiky2KTPh87wVmmB
	 2ywc3WVyUJSeuivyj7Mj1Kw2x/jK+GUCP0Sf5R1QnzlygcBBicPQ+BO8eXAMLhNisM
	 FD9/lZZG1ky3w==
Date: Tue, 5 Aug 2025 13:50:57 -0400
From: Sasha Levin <sashal@kernel.org>
To: Jiri Kosina <jkosina@suse.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <aJJEgVFXg4PRODEA@lappy>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>

On Tue, Aug 05, 2025 at 05:38:36PM +0200, Jiri Kosina wrote:
>This proposal is pretty much followup/spinoff of the discussion currently
>happening on LKML in one of the sub-threads of [1].
>
>This is not really about legal aspects of AI-generated code and patches, I
>believe that'd be handled well handled well by LF, DCO, etc.
>
>My concern here is more "human to human", as in "if I need to talk to a
>human that actually does understand the patch deeply enough, in context,
>etc .. who is that?"
>
>I believe we need to at least settle on (and document) the way how to
>express in patch (meta)data:
>
>- this patch has been assisted by LLM $X
>- the human understanding the generated code is $Y
>
>We might just implicitly assume this to be the first person in the S-O-B
>chain (which I personally don't think works for all scenarios, you can
>have multiple people working on it, etc), but even in such case I believe
>this needs to be clearly documented.

The above isn't really an AI problem though.

We already have folks sending "checkpatch fixes" which only make code
less readable or "syzbot fixes" that shut up the warnings but are
completely bogus otherwise.

Sure, folks sending "AI fixes" could (will?) be a growing problem, but
tackling just the AI side of it is addressing one of the symptoms, not
the underlying issue.

-- 
Thanks,
Sasha

