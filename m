Return-Path: <ksummit+bounces-2109-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE16B1E46E
	for <lists@lfdr.de>; Fri,  8 Aug 2025 10:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88E951605BE
	for <lists@lfdr.de>; Fri,  8 Aug 2025 08:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5846425CC42;
	Fri,  8 Aug 2025 08:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q7siI/iL"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C528E252287
	for <ksummit@lists.linux.dev>; Fri,  8 Aug 2025 08:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754641890; cv=none; b=VFHaqnXwf36nvj4tpq8mLmGWR9iMScRX6TrDOeoL7HDHIJwADPCJMbXLk86PXA9l0H0EHOXM8nSm2wtfr0oea1eOilng4MAL/A2sq4tgGRo3ch1MLrEclSDI7XmOZ2+l14GybhGfKUc4S5SFRWaeisREGxRWf1kKVkpJ/uQ2nZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754641890; c=relaxed/simple;
	bh=lpCZTJydimHOUAs8wk6PJ5dm5ufCusu9Go8cKixrRaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIbxpaepDOV90U7VBVxtAmEkORwro8rvi7z/qnR6s/pGK4DqahrXPC8EM0OR4YUsdt1uVflnCEg1x6WOGMVqujC5pqrNiJQbJoN776lFM+6Lu+GALXOtIfl2V/yPdrKkSmsTX+FlYwh+IVGt+NhcPYUINuPAmoaFpjg21o+tCx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q7siI/iL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61356C4CEED;
	Fri,  8 Aug 2025 08:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754641890;
	bh=lpCZTJydimHOUAs8wk6PJ5dm5ufCusu9Go8cKixrRaw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q7siI/iLyMJjSfqa6dTp+DIWMHuWlqiRp2aCK4U08YT12o3hfSpz/EFEMnoF+xemU
	 6Cdx8WFroXfhGZXvKgLIhIE4Pz90vgeuFK7Vfa8IEcBdbHLF3UJXPI6/VLDwhPwP6z
	 hwiLAJ7P0bQxtE4J/XjuLLn8qTfKpGwqHh8Oma2mt5y9DPcFBEdrHA8cyjcI+Kb5sF
	 XbgGvM+JfhMkVhdDIr7Y3zCubhkIBhOKazxIHmcIjCIEczq/87VLUL6VppOUFpl5qM
	 v1KdM37iVg78kLb85hbVzXKVum55h7CjRBAbtNbnymxqCN00nvwxze/2lQKQw9Vet8
	 HwOhf9zsVaekw==
Message-ID: <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
Date: Fri, 8 Aug 2025 10:31:27 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
To: Sasha Levin <sashal@kernel.org>, Jiri Kosina <jkosina@suse.com>
Cc: ksummit@lists.linux.dev
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aJJEgVFXg4PRODEA@lappy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/08/2025 19:50, Sasha Levin wrote:
> On Tue, Aug 05, 2025 at 05:38:36PM +0200, Jiri Kosina wrote:
>> This proposal is pretty much followup/spinoff of the discussion currently
>> happening on LKML in one of the sub-threads of [1].
>>
>> This is not really about legal aspects of AI-generated code and patches, I
>> believe that'd be handled well handled well by LF, DCO, etc.
>>
>> My concern here is more "human to human", as in "if I need to talk to a
>> human that actually does understand the patch deeply enough, in context,
>> etc .. who is that?"
>>
>> I believe we need to at least settle on (and document) the way how to
>> express in patch (meta)data:
>>
>> - this patch has been assisted by LLM $X
>> - the human understanding the generated code is $Y
>>
>> We might just implicitly assume this to be the first person in the S-O-B
>> chain (which I personally don't think works for all scenarios, you can
>> have multiple people working on it, etc), but even in such case I believe
>> this needs to be clearly documented.
> 
> The above isn't really an AI problem though.
> 
> We already have folks sending "checkpatch fixes" which only make code
> less readable or "syzbot fixes" that shut up the warnings but are
> completely bogus otherwise.
> 
> Sure, folks sending "AI fixes" could (will?) be a growing problem, but
> tackling just the AI side of it is addressing one of the symptoms, not
> the underlying issue.


I think there is a important difference in process and in result between
using existing tools, like coccinelle, sparse or even checkpatch, and
AI-assisted coding.

For the first you still need to write actual code and since you are
writing it, most likely you will compile it. Even if people fix the
warnings, not the problems, they still at least write the code and thus
this filters at least people who never wrote C.

With AI you do not have to even write it. It will hallucinate, create
some sort of C code and you just send it. No need to compile it even!

We do see poor contributions based on reports from existing tools, like
you mentioned, but the AI can significantly increase the flood of poor
contributions, that's why I call this tool different. And that
difference deserves annotation and treating differently than checkpatch
or coccinelle fixes.

I am all for requirement of marking AI-assisted patches, so I can set up
my filters correctly and ignore GPL-4.0, GPL-6.0 or other hallucinated
code (I already saw such in Devicetree bindings subsystem).

Best regards,
Krzysztof

