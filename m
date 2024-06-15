Return-Path: <ksummit+bounces-1287-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A929097F4
	for <lists@lfdr.de>; Sat, 15 Jun 2024 13:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD734B21923
	for <lists@lfdr.de>; Sat, 15 Jun 2024 11:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87FC93D393;
	Sat, 15 Jun 2024 11:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="n8lDfCwV"
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBC93AC0F
	for <ksummit@lists.linux.dev>; Sat, 15 Jun 2024 11:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718451004; cv=none; b=YANROZ19xv4JInS0wgaIipusGnYdNQKvlHpnVeiK5InKw4wcR4oX8OoXE2iFcY5tiLB+H4YorJzBcLoMwk4LfXhorPr5Du3+Q64fg65LRSl0z2tVVM5kMqY+4UFPYegi47nM/9mml6AP3YCIZV991C7lbWT3EoN1B44ohr2afIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718451004; c=relaxed/simple;
	bh=mNzTUlSw+Nf6o3+yNoWrTmCVyQwIfVldzNMXwnDX47M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F3P7292jhuy/K5Y9fVQ3wdAYlTyETuWd15k8cHQx3ScSr6Zjs/anDd6TAi35ywGi8I4Cwrsbnt4AZsKpoza0WoQhM5lCsl7D1lhXtbWpK4q54HzPkN6uF65q6YbG/RlDm2zv/dcabCNmHAU6xdrtS4nazwLBqWKVVeVu9w9UxeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=n8lDfCwV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1718450992;
	bh=uMAJ2SHRBiH5u1yHyzDZ7jFDvcJVu32MG4V/WgCPaYE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n8lDfCwVc1Lp8Yq8vSW8bKghtMAfb9n95XlnTbNS8IcuCeoNH69yAcBmXVy77pX9+
	 oDhkr9vFcl/YMYG0/nn/QU7Anv2/teLkCkJe2BM5hh4M0cTxla0dZxsV9uY/yKrjH+
	 sCvZSzSPnQ0uMf9kK0Os8p30YiyFUF/esmpcL/fpt/D5Rbnaoqx6dcSOSe3qQHDWY+
	 VSab6ESnuK7X5sIiHPedyLHZiivGhHloY76LaVbwTZMjDVjF/bvgipSsXFaq+jHvSc
	 9T36qh/FMjyqt63dfd4d4zrqMMMTlRhuBWKJvS3B8Y/4+tNAw3SgpEd6F67kJP9X+R
	 0+OMPWM9vqdPQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W1YpR2sljz4wqK;
	Sat, 15 Jun 2024 21:29:51 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Cc: Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
In-Reply-To: <CAMuHMdXS4E3sfzcmBE0G8x4-G7tY==rZvMy269bSbV3LoYTQSA@mail.gmail.com>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <87plsjoax6.fsf@mail.lhotse>
 <20240614-almond-lorikeet-of-reading-6d959f@lemur>
 <CAMuHMdXS4E3sfzcmBE0G8x4-G7tY==rZvMy269bSbV3LoYTQSA@mail.gmail.com>
Date: Sat, 15 Jun 2024 21:29:48 +1000
Message-ID: <87msnmo34j.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Geert Uytterhoeven <geert@linux-m68k.org> writes:
> Hi Konstantin,
>
> On Fri, Jun 14, 2024 at 4:38=E2=80=AFPM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
>> On Sat, Jun 15, 2024 at 12:29:09AM GMT, Michael Ellerman wrote:
>> > > 1. disambiguates Link: trailers so they point to relevant online dis=
cussions
>> > > 2. allows tooling like b4, patchwork, etc, to reliably match commits=
 to
>> > >    submissions for the purposes of better code review automation
>> > > 3. allows stable and similar projects to better track series groupin=
g for
>> > >    commits
>> >
>> > Message-Id: sucks, I want a link I can open with a single click.
>>
>> But why would you want to, on a regular basis? Viewing the series submis=
sion
>> has got to provide near zero useful info -- if it was accepted into the =
tree,
>> then at most it would have a couple of stray code review trailers.
>
> I open these links regularly (as in daily), for various reasons:
>   - Finding the thread to reply to when reporting a bug,
>   - Checking for new Rb-tags given,
>   - As a starting point for reading earlier submissions of the
>     same patch,
>   - ...

Yep, all those.

I also use them to check that the version of a patch I have committed
locally in my testing tree is still the latest submission, before
pushing. Because the time between applying a patch and pushing it can be
days if it needs lots of testing.

Another case from yesterday was a ~3 year old patch, someone was asking
about backporting. I opened the link to the submission and saw that
someone had replied to it reporting a bug (that I had forgotten about).

cheers

