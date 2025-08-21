Return-Path: <ksummit+bounces-2181-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDD6B301AB
	for <lists@lfdr.de>; Thu, 21 Aug 2025 20:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DE8F1CE4119
	for <lists@lfdr.de>; Thu, 21 Aug 2025 18:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7298834165B;
	Thu, 21 Aug 2025 18:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ab07SxrT"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A852E36EA
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 18:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755799325; cv=none; b=J0YtIg6t+cuKpe0X8sce0flyr/JLSpvN9m1SBFA7MrgpmkkfJWJoXzLzeH6By3uUfMe8/U2eNRA3MFhRgTDMb71ydvyg2SgRwZ9Y/h20l5SVwquB4drdugW/C4gx8ai8zJFRk8MCBrMScQoUxEQMj+iWStgkOHRLLd5u4j8aRlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755799325; c=relaxed/simple;
	bh=+L/PMHVvqE99dEGKljkUMEwd3tcbh9ogbNgNiTLNWPE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pHo8PmvDpTKSgoyYX1Y+W1oVrpxiQDukb6FEpEhfvPN/JhTLl5MXaPfSDVNk/f2JZ1Nq7jg41nt3Ce7sH15Due5SzZ1GjyUDxb4yvD9/3c9lU8g0Wq5jOfHXtTvrXuzneG4LUzpA9XwVVFTd2xH2EwNWYgBu3vowwc/cvmRLdEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ab07SxrT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBEACC4CEEB;
	Thu, 21 Aug 2025 18:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755799324;
	bh=+L/PMHVvqE99dEGKljkUMEwd3tcbh9ogbNgNiTLNWPE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ab07SxrTFV9HzF1wIRKuL3CNOzZJ1hq3ZJdVJmBovpgarjXF5cdOnDav9J32cGCuG
	 QjuQH3fFLwP7F/fL37MTfeN/+iiQ7rqyy0/tVmhcysbu1j6SSBN9+TBwK2O7LYNyyk
	 5xV12KruSNMDlU8lhP8a+70sA81OBQFKrI8Qr+t2NpkqkVUC5/sCHxyimAeuD7HgG/
	 sUfB9XBVrGnfPWvuo7zRD0pfByfu2th20ilW6aThxwQOF+APdp5ndIx/Nb1yvkyWoB
	 HhMh30j2FMnkQ+GhNdXD7sg+2Yrvn41FxqOwdu02P1cUkjl5EfOsBpV8d62p9OqPVB
	 l+uOtojjCR5mA==
Date: Thu, 21 Aug 2025 20:01:59 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Jiri Kosina <jkosina@suse.com>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250821200159.1bcdf0c9@foz.lan>
In-Reply-To: <DS7PR11MB60772F52AF3A152B5AB04A1CFC32A@DS7PR11MB6077.namprd11.prod.outlook.com>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<aJJEgVFXg4PRODEA@lappy>
	<12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
	<f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
	<c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
	<9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop>
	<20250818230729.106a8c48@foz.lan>
	<9383F8DB-CD38-40CC-B91D-7F98E8156C04@HansenPartnership.com>
	<4tacplepoih3wvejopmtkdg7ujtvwmufd5teiozk5im2jikn7a@jdbou6kwindl>
	<d565cb60-29bd-4774-995d-0154c0046710@paulmck-laptop>
	<20250821122329.03c77178@foz.lan>
	<20250821125037.5cf5be3d@gandalf.local.home>
	<20250821193041.398ed30b@foz.lan>
	<DS7PR11MB60772F52AF3A152B5AB04A1CFC32A@DS7PR11MB6077.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 21 Aug 2025 17:36:54 +0000
"Luck, Tony" <tony.luck@intel.com> escreveu:

> > Do you remember the first time you saw that, and what copyrights
> > were there? :-)  
> 
> Kernighan and Ritche "The C programming language" - First edition.

I saw it there too, but I probably saw it before that, on an "80 Micro"
Magazine edition which I don't recall anymore.

Btw, Wikipedia says it came from a BCPL code (*). So, K&R were not the
original authors.

(*) https://en.wikipedia.org/wiki/%22Hello,_World!%22_program

Anyway, the point is: i we weren't trained with such pattern, 
a printf() with "Hey" or "Hi" would be a more likely answer.

That's said, in the early programming days, I used a lot more
this pattern (**):

	The quick brown fox jumps over the lazy dog

(**) https://en.wikipedia.org/wiki/The_quick_brown_fox_jumps_over_the_lazy_dog

with has all 23 English characters. I have absolutely no glue when
I first saw it, but it was before I got "C Programming Language" 
book in hands, as I used it for a code I developed in Assembler
before learning C.

Yet, as I saw a lot more the "Hello world", I haven't using the
brown fox pattern for years.

Anyway, the point is: AI repeat patterns, but it will very likely
repeat the ones that are used on tons of different places, where
it is really hard to have any copyrights applied (as they become
common sense). Humans do the same.

Thanks,
Mauro

