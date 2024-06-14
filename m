Return-Path: <ksummit+bounces-1268-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF9B908D5D
	for <lists@lfdr.de>; Fri, 14 Jun 2024 16:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E48731C24F1B
	for <lists@lfdr.de>; Fri, 14 Jun 2024 14:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544639463;
	Fri, 14 Jun 2024 14:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="jpyHQFNZ"
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710CE171B0
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 14:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718375356; cv=none; b=fcKuoTXSvPpYLFE8786dY+U4/4bTx/zsBMoFgAYpQOe5ebD1QrLd438ICKE4mTvLGEcGpOCCW1NBjpYTu84A7V2Vgc2gWgxm4le2aT3n0Rj9L0egPoIPpOHnentsCPYailt4J19d7JXKGKbtDiGjsjZiFwMXKlvT2OkmM1+BksA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718375356; c=relaxed/simple;
	bh=EjE/CNY3MYU3DSnFNB2OK5RyKukqn3rd7siASMEgtIw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tTQQ8xuQ7LRRAxko0zeaEaYBNPA04V/ZFB4zLznkcIC9JpK638FuwAxj/u67iMSVMFRvEKvYsjhH8g88l0FHMRh+sYQjvBsMX7g5+tjb3I5+jjhAmGVWOWCLjja15rOhWo6ZjIvHAPJF881ui9nFKKHlvQfC3nNftfAf1arQ03o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=jpyHQFNZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1718375350;
	bh=C2t/dWnqkr6UGY0jC6xomHjUuYK1g2JgKYbXOiIcnKY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jpyHQFNZnMu/eY+gCu76ejJwEq4zNXaS+/w188+Tul9GeAyP0ySGG1yf+PMWZ9V6Z
	 ujK2EHqHUyqMi4TZD7d5JP3DcLiX8pbwttWIx44M5P9Rlu3n6miqvJA+44sWbhacFT
	 AsaRXfqsN2NOgnGniX+EoQT2nXY8LNNV126HFq7bEjpIakvJBDheKdD9o7iPjb8L+/
	 JHlDhGA2MHVPfPTqXEhvj+e1mSouk6aAvfNy808cmkvFk0jbMPKYenBfqhk7Fe6VYK
	 flce9hIPEtQ0xPnVuu5OeZan/3YhDMFRYqZoj3x8bGV0RI/ic2rONKAhucl0RFAwic
	 s6RJM2sfYNNTg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W11qn4Pbgz4wc3;
	Sat, 15 Jun 2024 00:29:09 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jan Kara
 <jack@suse.cz>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev"
 <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
In-Reply-To: <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
Date: Sat, 15 Jun 2024 00:29:09 +1000
Message-ID: <87plsjoax6.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:
> On Thu, Jun 13, 2024 at 11:59:17AM GMT, Jan Kara wrote:
>> > * One cause of regressions that happen in stable trees (and not in
>> > mainline) I've seen quite a few times are backports of commits with
>> > Fixes: tags that were part of a patch-series and depend on earlier
>> > patches from the series. The stable-team afaics has no easy way to spot
>> > this, as there is no way to check "was this change part of a series".
>> > Sometimes I wonder if a dedicated tag linking to the submission of a
>> > patch could help -- and is something quite a few maintainers already
>> > really want and add using a "Link" tag despite Linus dislike for that
>> > (IIRC).
>> 
>> FWIW I (and a few other maintainers) use 'Message-Id' tag to link to
>> submission. This is still easily convertible to lore link and unlike 'Link'
>> tag it is clear what this tag is about and that it is not just a link to
>> related discussion or something like that. AFAIK this also addresses Linus'
>> dislike because what he was complaining about is that 'Link' should be
>> linking to some useful context for the changelog, not just patch
>> submission.
>
> I am strongly in favour of that from the tooling perspective. Linus suggested
> that we can always trace the original patch submission from the commit by
> using the patch-id, but that doesn't work reliably. I mused on that here:
>
> https://lore.kernel.org/git/20240605-hilarious-dramatic-mushroom-7fd941@lemur/
>
> The gist is that we cannot reliably match the patch-id of the original
> submission from the git commit, because there are multiple ways to generate
> the same patch, such as changing the diff algorithm (myers vs. minimal vs.
> histogram), or changing the number of context lines. If the original author
> generated their patch with --histogram, but we try to find it by generating
> the same patch using the default myers algorithm, we may not find it.
>
> The "Message-Id" trailer is already documented in git:
> https://www.git-scm.com/docs/git-am#Documentation/git-am.txt---message-id
>
> I suggest we move away from the practice of using Link: trailers to indicate
> the patch provenance to using Message-Id: trailers for the same purpose. This
> solves multiple problems:
>
> 1. disambiguates Link: trailers so they point to relevant online discussions
> 2. allows tooling like b4, patchwork, etc, to reliably match commits to
>    submissions for the purposes of better code review automation
> 3. allows stable and similar projects to better track series grouping for
>    commits

Message-Id: sucks, I want a link I can open with a single click.

At your suggestion I switched to using https://msgid.link/ as the target
for patch links, eg:

  Link: https://msgid.link/20240529123029.146953-2-mpe@ellerman.id.au

Which gives the reader a hint that the link is just to the submission.

I don't really care if the tag is "Link:", but it has to be a URL, not
just a bare message-id that I have to cut and paste like it's the stone
age.

cheers

