Return-Path: <ksummit+bounces-2152-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DF6B2B16B
	for <lists@lfdr.de>; Mon, 18 Aug 2025 21:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C07293B0280
	for <lists@lfdr.de>; Mon, 18 Aug 2025 19:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D684ECA52;
	Mon, 18 Aug 2025 19:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRwgLj/X"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395CF3451A8
	for <ksummit@lists.linux.dev>; Mon, 18 Aug 2025 19:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755544439; cv=none; b=hn4TC/DEwvk3XycVWtsYGRmkYmSxFkR3MRP4fpjHbDYuiLxCg+4nUXKEKlkcRzEV2ZnvijpHgGnHm41Gt36+7AaEP5J/CpzZw5VEXTHrYuTT1+A2w4RF1QDOgysdzyW1OJIOp72sZ02VQ049N5BV6YeCVwi5TsS8EtU7a1s3uOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755544439; c=relaxed/simple;
	bh=TuIoLTyXvj8k/Nkp5Ew6o+CV33Ouq23Wjg4zsUcoZsY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xnrcqdr9aaoq+s/n8LAYt/VQ58UzNZ9llITdMgPlJ6BBZVCMnhz+Uvs8idABQrL3LzjFLN1lFvYAftaZ0WGoD47XwPyXPv1Iz5OqrR87RjxGvTVc4A8tK8hZB+MY7NWu2r3vf8qKhazDaRQQ40AX/uUJI3aw6KQ3Isj+K4CoeiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRwgLj/X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4083CC4CEEB;
	Mon, 18 Aug 2025 19:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755544438;
	bh=TuIoLTyXvj8k/Nkp5Ew6o+CV33Ouq23Wjg4zsUcoZsY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sRwgLj/XpK5Dk2E2Vs6i9H+WVrcjEROsDNs7mOmCieAc4wI3JBVf4ZBS378A2VEf5
	 h7bvT58fLs0857u/hRY6MIlxyBobKgQ7M3nLsgFve21a2agebLm9eQ/2buZqFQutY3
	 AMy4l6rxHq3uwFPMQypKPPhGzGwDRwsPgnZ4OjYV/oXc4RfhjZ8lU557vc742S10Ae
	 1VMGXz73kaz1jGEFxZJeX7aGPK5yEFqeSws1U13Oher+covMm4XdSHFY10iIwksMgj
	 jUUzCuy0TkBVi23tuz0ntQQNGcFKbUFXp72OmKTOeFRzew1OFGBLNEGxWIrOmb4CiF
	 o5YoU5ZpmMt4A==
Date: Mon, 18 Aug 2025 21:13:54 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: paulmck@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin
 <sashal@kernel.org>, Jiri Kosina <jkosina@suse.com>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250818211354.697cb25a@foz.lan>
In-Reply-To: <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<aJJEgVFXg4PRODEA@lappy>
	<12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
	<f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
	<c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Em Tue, 12 Aug 2025 09:38:12 +0100
James Bottomley <James.Bottomley@HansenPartnership.com> escreveu:

> On Mon, 2025-08-11 at 14:46 -0700, Paul E. McKenney wrote:
> > On Fri, Aug 08, 2025 at 10:31:27AM +0200, Krzysztof Kozlowski wrote: =20
> > > On 05/08/2025 19:50, Sasha Levin wrote: =20
> > > > On Tue, Aug 05, 2025 at 05:38:36PM +0200, Jiri Kosina wrote: =20
> > > > > This proposal is pretty much followup/spinoff of the discussion
> > > > > currently happening on LKML in one of the sub-threads of [1].
> > > > >=20
> > > > > This is not really about legal aspects of AI-generated code and
> > > > > patches, I believe that'd be handled well handled well by LF,
> > > > > DCO, etc.
> > > > >=20
> > > > > My concern here is more "human to human", as in "if I need to
> > > > > talk to a human that actually does understand the patch deeply
> > > > > enough, in context, etc .. who is that?"
> > > > >=20
> > > > > I believe we need to at least settle on (and document) the way
> > > > > how to express in patch (meta)data:
> > > > >=20
> > > > > - this patch has been assisted by LLM $X
> > > > > - the human understanding the generated code is $Y
> > > > >=20
> > > > > We might just implicitly assume this to be the first person in
> > > > > the S-O-B chain (which I personally don't think works for all
> > > > > scenarios, you can have multiple people working on it, etc),
> > > > > but even in such case I believe this needs to be clearly
> > > > > documented. =20
> > > >=20
> > > > The above isn't really an AI problem though.
> > > >=20
> > > > We already have folks sending "checkpatch fixes" which only make
> > > > code less readable or "syzbot fixes" that shut up the warnings
> > > > but are completely bogus otherwise.
> > > >=20
> > > > Sure, folks sending "AI fixes" could (will?) be a growing
> > > > problem, but tackling just the AI side of it is addressing one of
> > > > the symptoms, not the underlying issue. =20
> > >=20
> > > I think there is a important difference in process and in result
> > > between using existing tools, like coccinelle, sparse or even
> > > checkpatch, and AI-assisted coding.
> > >=20
> > > For the first you still need to write actual code and since you are
> > > writing it, most likely you will compile it. Even if people fix the
> > > warnings, not the problems, they still at least write the code and
> > > thus this filters at least people who never wrote C.
> > >=20
> > > With AI you do not have to even write it. It will hallucinate,
> > > create some sort of C code and you just send it. No need to compile
> > > it even! =20
> >=20
> > Completely agreed, and furthermore, depending on how that AI was
> > trained, those using that AI's output might have some difficulty
> > meeting the requirements of the second portion of clause (a) of
> > Developer's Certificate of Origin (DCO) 1.1: "I have the right to
> > submit it under the open source license indicated in the file". =20
>=20
> Just on the legality of this.  Under US Law, provided the output isn't
> a derivative work (and all the suits over training data have so far
> failed to prove that it is), copyright in an AI created piece of code,
> actually doesn't exist because a non human entity can't legally hold
> copyright of a work.  The US copyright office has actually issued this
> opinion (huge 3 volume report):
>=20
> https://www.copyright.gov/ai/
>=20
> But amazingly enough congress has a more succinct summary:
>=20
> https://www.congress.gov/crs-product/LSB10922
>=20
> But the bottom line is that pure AI generated code is effectively
> uncopyrightable and therefore public domain which means anyone
> definitely has the right to submit it to the kernel under the DCO.
>=20
> I imagine this situation might be changed by legislation in the future
> when people want to monetize AI output, but such a change can't be
> retroactive, so for now we're OK legally to accept pure AI code with
> the signoff of the submitter (and whatever AI annotation tags we come
> up with).
>=20
> Of course if you take AI output and modify it before submitting, then
> the modifications do have copyright (provided a human made them).

On my tests with AI, humans need to modify it anyway. It reminds me
the (not so) good old code generators we had in the past: AI-generated
code, even when it works, it usually have unneeded steps and other
caveats that require human interaction to clean it up and fix.

I got good results with AI for things like generating unit tests, but
once tests are generated, still 50%-60% of them fails because AI
did stupid things, like not counting whitespaces right, and even
sometimes forgetting parameters and arguments.

=46rom several aspects, it looks like contact a very junior intern
that knows a programming language and code really fast, but it has
no glue about how to generate a production quality level code.

After dozens of interactions, the code can be used as the bases for
a senior professional to modify it and have something ready for
merging.

The net result is that:

1. AI alone doesn't produce a ready-to-merge code;
2. Lots of refinement requirements made by humans to shape the code=20
   into something that actually works;
3. During AI interaction, human has to intervene several times to
   avoid AI to hallucinate. Sometimes, it also has to close the
   chat and open again - or even use a different LLM model when
   AI can't converge;
4. At best scenario, human still needs to read the code and carefully
   modify for it to make sense; at worse, it has to write its own
   code, eventually using some suggestions from the AI hallucination.

Heh, there are exceptions: if one asks AI to produce a hello world
code (or something that "plays by the book" - e.g. when AI can use
thousands of references from code in public domain) the code is not=20
that bad: it is just a variant of some public domain code.

Thanks,
Mauro

