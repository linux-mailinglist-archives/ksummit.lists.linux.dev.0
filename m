Return-Path: <ksummit+bounces-2162-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 429ADB2C840
	for <lists@lfdr.de>; Tue, 19 Aug 2025 17:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34ED9168EDA
	for <lists@lfdr.de>; Tue, 19 Aug 2025 15:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4542820A9;
	Tue, 19 Aug 2025 15:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAiL0tss"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6897E281532
	for <ksummit@lists.linux.dev>; Tue, 19 Aug 2025 15:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755616459; cv=none; b=Sd1ZGSRNWLSI/SPKNllp/mnujX8+h56ciPTvCKoVlnjWNgUWunbtYBbGhRselmpQrFJMzmWzzTnXd6OxNI//RDRWTy2R9sE7ohNiBlpbxRDV8q8ErZ5yOiQFwtx6h7elJeEynL8enmhUUVMi3Y95iZ3+AnqEZKg97odJdIpCs3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755616459; c=relaxed/simple;
	bh=o1FJEYVYRjxmYJrMMR9v4cQSHl0BA1GRDdfbTC3oPqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hn1uXwKWsH4IhqXER+4j2P5gh1xA4R3l8Xx1mK3khffkhaEIPP3NRS7M7ZmKPaYKotuWyKIx9Irn2bKW/omY6TXtxxKsf8p2CD+/HG958y0h6icrKWRCzMHOA6fLMsd8aDF22GyZkixQKwJFuROKK3XATTnoExtam2MG6ahZ9cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAiL0tss; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1672C4CEF1;
	Tue, 19 Aug 2025 15:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755616458;
	bh=o1FJEYVYRjxmYJrMMR9v4cQSHl0BA1GRDdfbTC3oPqw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=nAiL0tsswVAl3aiTEPQeYVhUuRzhyxCjNs8TpvyMvdyt3tkRBY9hsOyop0z7f1XfP
	 t09UJoNE+MwuiMLAfeSswFkIGKqKWWEcLufhVEohUADHnHE1c/Cju/G1C95iNkI7b7
	 Ql3w+PKbxM1EKmBxRZWg3IYMNYq8fNCaF4DWO3MAQwjE7faBbq9Yh7RdmejxhxIuQp
	 tixZo9ZRUgcu+rpTf2fEWRz6zq7JThMqjvFIp4jbguu8WWCaLPP+OyhZnhtx6v2q6u
	 ZNFFZw9+7+PR4AliceIfQRhZff41Yk7tsTiHhn+1cZP5JHMlB1q1g11xWtwhL1c1Id
	 oS7rTdrFl9F+Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7FE77CE0853; Tue, 19 Aug 2025 08:14:18 -0700 (PDT)
Date: Tue, 19 Aug 2025 08:14:18 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sasha Levin <sashal@kernel.org>, Jiri Kosina <jkosina@suse.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <6e2406f2-b55d-4af2-85a7-66940ec191f1@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
 <CAJZ5v0iBLndaGmF=_VHy8bi5F7Ey0Ov+pCtd2Wt9+_uAkW1e-A@mail.gmail.com>
 <F9AF2AA7-0E12-43E9-A34C-2D45CA591DEC@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F9AF2AA7-0E12-43E9-A34C-2D45CA591DEC@HansenPartnership.com>

On Mon, Aug 18, 2025 at 07:32:26PM +0100, James Bottomley wrote:
> On August 18, 2025 6:53:22 PM GMT+01:00, "Rafael J. Wysocki" <rafael@kernel.org> wrote:
> >On Tue, Aug 12, 2025 at 10:41 AM James Bottomley
> ><James.Bottomley@hansenpartnership.com> wrote:
> [...]
> >> But the bottom line is that pure AI generated code is effectively
> >> uncopyrightable and therefore public domain which means anyone
> >> definitely has the right to submit it to the kernel under the DCO.

I sympathize with this argument, and I hope that it prevails.  But there
is no guarantee that it will do so.

I mean, sure, there is precedent going back centuries that a given human
being can ingest large quantities of copyrighted material, and generate
a work that *by* *default* has no copyright connection to any of the
ingested material.  And sure, there is also less-well-established but
still good reason to believe that only human beings can hold copyright.
And putting those two together would give your "bottom line", that the
output of an AI is in public domain, just like that famous simian selfie.
(Of course, that "by default" is subject to plaigarism tests.)

But this argument already assumes that human beings are special, which
might or might not augur well for the argument that AI-generated output
based on copyrighted input should be treated the same as is similar
human-generated output.

Again, I sympathize with your position and I hope that it proves to be
correct, but I don't see that we are there yet, if in fact we ever get
there at all.

Or do you have a public statement from (say) a Linux Foundation attorney
that we can rely on?

> >Well, if it isn't copyrightable, then specicially it cannot be
> >submitted under the GPLv2 which is required for the kernel, isn't it?
> 
> No. Public domain code can be combined with any licence (including GPL) because it carries no incompatible obligations since it carries no obligations at all.  You can release public domain code under any licence, but you can't enforce the licence except on additions or modifications because the recipient could have obtained the original from the original obligation free source.

But I do agree that public-domain code can be combined with GPLv2 code.
At least assuming that we maintain a sufficient paper trail back to the
original public-domain code.

							Thanx, Paul

> Regards,
> 
> James
> 
> -- 
> Sent from my Android device with K-9 Mail. Please excuse my brevity.

