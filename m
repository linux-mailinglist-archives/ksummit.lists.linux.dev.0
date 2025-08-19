Return-Path: <ksummit+bounces-2166-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EB3B2C94F
	for <lists@lfdr.de>; Tue, 19 Aug 2025 18:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C97B1C21E47
	for <lists@lfdr.de>; Tue, 19 Aug 2025 16:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214E418C03F;
	Tue, 19 Aug 2025 16:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPpCqs1W"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F33BA4A
	for <ksummit@lists.linux.dev>; Tue, 19 Aug 2025 16:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755620173; cv=none; b=IP3LWTPqlX0+O+mzJ3PWU90yyWs5GvKArJBIQIhL6bCNhb214BYdEdWl13/XgkgvbTY99B8DHsX4sdZc9zrxlf2kzMSyWVzbtLZUpZXMr1dkupvMzMRltIx6/MIFVIIge1rHdJ+S8JS19dDUufbEoS11RktdmfhI1zpPGj7ItbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755620173; c=relaxed/simple;
	bh=XHVYxH2H1yGmj68UzztRAIROBjvP5MYCR8M7zKD96JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IoygNApy6eoEHWd4NXfvB0Fe/jKYt+A6Fa4zDiIe5HydeutXc0S+81uhs61RbCHtX3qT/tczSjZoyHdLOQtPAiFGmxX4n+wPz+D3xKZR7m+44zcXDZNNVPzNZI28RvpXiU31pjQZSLiG/UmPnlA6NDI4mg9XapmRS50vngEp3s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPpCqs1W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114F8C4CEF1;
	Tue, 19 Aug 2025 16:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755620173;
	bh=XHVYxH2H1yGmj68UzztRAIROBjvP5MYCR8M7zKD96JU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPpCqs1WmHaOdt1jNsCDgfyvxPIGhYZ13hW6y7gx6rCP6UUkgt23j8qAkaaegewQS
	 Loegb6OPE470KVDOtRfoAf5rakepVAq/wLxnBqpdgwuHinZRE1o3TJrjhiEEEOhuLH
	 D70Vzp4VxR/SEb3mk6xNhEMDMk168HvSq2V7eMW+kLYcXgLBqj5E9Jr+n0Pg1tydHU
	 uYpIOXaGYjp2d7W1QXeCJ2cjQRyswiulCBPVSaZ/CjWccftkvHJ1WqANF7t/3cOzPl
	 d0ljphAfL0Pwkssvgn4xM5yZGjFhwJvysojNIS1t5l4zh6Uyj//9dB0qp/CXsXcijh
	 SFkNZcDVXU2hw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uoP0M-00000007MU7-0Nka;
	Tue, 19 Aug 2025 18:16:10 +0200
Date: Tue, 19 Aug 2025 18:16:10 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	"Paul E. McKenney" <mchehab+huawei@kernel.org>, 
	Krzysztof Kozlowski <mchehab+huawei@kernel.org>, 
	Sasha Levin <mchehab+huawei@kernel.org>, 
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <4tacplepoih3wvejopmtkdg7ujtvwmufd5teiozk5im2jikn7a@jdbou6kwindl>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
 <9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop>
 <20250818230729.106a8c48@foz.lan>
 <9383F8DB-CD38-40CC-B91D-7F98E8156C04@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9383F8DB-CD38-40CC-B91D-7F98E8156C04@HansenPartnership.com>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Tue, Aug 19, 2025 at 04:23:46PM +0100, James Bottomley wrote:
> On August 18, 2025 10:07:29 PM GMT+01:00, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >Em Tue, 12 Aug 2025 07:42:21 -0700
> >"Paul E. McKenney" <paulmck@kernel.org> escreveu:
> [...]
> > do agree that many of the lawsuits seem to be motivated by an
> >> overwhelmening desire to monetize the output of AI that was induced by
> >> someone else's prompts, if that is what you are getting at.  It does seem
> >> to me personally that after you have sliced and diced the training data,
> >> fair use should apply, but last I checked, fair use was a USA-only thing.
> >
> >Maybe, but other Countries have similar concepts. I remember I saw an
> >interpretation of the Brazilian copyright law once from a famous layer
> >at property rights matter, stating that reproducing small parts of a book, 
> >for instance, could be ok, under certain circumstances (in a concept
> >similar to US fair use).
> 
> Yes, technically.  Article 10 of the Berne convention contains a weaker concept allowing quotations without encumbrance based on a three prong test that the quote isn't extensive,  doesn't rob the rights holder of substantial royalties and doesn't unreasonably prejudice the existing copyright rights.

Exactly. The interpretation from such speech I mentioned is based on that.
Now, exactly what is substantial is something that could be argued.

There are two scenarios to consider:

1. AI using public domain or Open Source licensed code;

There are so many variations of the same code patterns that AI
was trained, that it sounds unlikely that the produced output would
contain a substantial amount of the original code.

2. Public AI used to developt closed source 

If someone from VendorA trains a public AI to develop an IP protected driver
for HardwareA with a very specialized unique code, and someone asks the
 same AI to:

	"write a driver for HardwareA"

and get about the same code, then this would be a possible legal issue. 

Yet, on such case, the developer from VendorA, by using a public AI,
and allowed it to be trained with the code, opened the code to be used
elsewhere, eventually violating NDA. For instance, if he used
Chatgpt, this license term applies:

	"3. License to OpenAI

	 When you use the service, you grant OpenAI a license to use
	 your input for the purpose of providing and improving the 
	 service—this may include model training unless you’ve opted out.

	 This license is non-exclusive, worldwide, royalty-free, 
	 sublicensable—but it's only used as outlined in the Terms of Use
	 and privacy policies."

So, if he didn't opt-out, it granted ChatGPT and its users a patent-free
sublicensable code.

Ok, other LLM tools may have different terms, but if we end having
to many people trying to monetize from it, the usage terms will be
modified to prevent AI holders to face legal issues.

Still, while I'm not a lawyer, my understanding from the (2)
is that if one uses it for closed source development and allowed
implicitly or explicitly the inputs to be used for training, the one
that will be be accounted for, in cases envolving IP leaking, is the
person who submitted IP protected property to AI.

-- 
Thanks,
Mauro

