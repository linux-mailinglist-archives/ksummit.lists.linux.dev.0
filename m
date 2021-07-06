Return-Path: <ksummit+bounces-263-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A133BDE1C
	for <lists@lfdr.de>; Tue,  6 Jul 2021 21:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 79CF13E10A6
	for <lists@lfdr.de>; Tue,  6 Jul 2021 19:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCDB2F80;
	Tue,  6 Jul 2021 19:39:48 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDC170
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 19:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=zM1PwtvWWlB7VWLnhKdB+MDdQchkb5OSHnhetbR9A+s=;
	t=1625600387; x=1626809987; b=htfHGlgYwoT+Ajm3rV17Lumwp9lrqOOHDsG+0LC5ct8YxkL
	5Wsc/RRIrslb1SegoqqqrFHwdhvEFnI1b58780+JRbkhrBepOz/rq1FbJKE2uAWQ9w8G/p/12UopW
	f//kXyYKmAcsTgMXmRsw0/wFBkR98jfHUr/TGAyJZCh8NQibGLg+RdxWygkFvk2nDAXu47pG/dZ+W
	7L196TAxoBxBu205y4vtBWBuqBc/VxO++tv7H4hgSnNNjwvjF4RoM9G51UTm9oXPOmpzZXSSoTu/h
	hhdQrxlDGDUqZwhKePzazke0QUirJ8aG0Pp7P/PkYs+DKE/3yNuE++XcE4zzMjyw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1m0qVP-00GLlP-I3; Tue, 06 Jul 2021 21:13:15 +0200
Message-ID: <db6ee5da45bbf526b13fda7d1cd2bf93f24cd84f.camel@sipsolutions.net>
Subject: Re: [TECH TOPIC] Rust for Linux
From: Johannes Berg <johannes@sipsolutions.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Linus Walleij
	 <linus.walleij@linaro.org>
Cc: Leon Romanovsky <leon@kernel.org>, ksummit@lists.linux.dev
Date: Tue, 06 Jul 2021 21:13:14 +0200
In-Reply-To: <CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com>
References: 
	<CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
	 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
	 <YOPcZE+WjlwNueTa@unreal>
	 <CACRpkdYDF-7=O1gc=Fh_mywtAgAtEVZhvoZXDFsAHMZe4FPGHQ@mail.gmail.com>
	 <CANiq72m3dkUOoAfQz8vY2UR3uaUkFD8rs=95k7sEm0KEqU8Zxw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned

On Tue, 2021-07-06 at 16:30 +0200, Miguel Ojeda wrote:
> 
> But that does not mean we are not rewriting a second kernel either --
> for instance, we have red-black trees "abstracted" in the Rust side by
> reusing C's API.
> 
> In other words, what we are doing is "abstract" the C APIs into Rust
> APIs that can ensure as many invariants as possible statically, using
> Rust facilities for that. Thus Rust is one more consumer of the C
> APIs.

I couldn't really find a good place too hang this question, so it's here
now ;-)

Mostly from what I've seen you've been talking about rust being the
'leaves' in the graph, in the sense that it consumes C APIs exposed by
the kernel elsewhere, etc. In drivers using things, for example.

How about the other way around? What if we'd want to slowly replace
(parts of) a subsystem with rust code, but leave drivers? Or let's say
write some data structures in rust because of the stated benefits, but
let C consumers exist?

johannes


