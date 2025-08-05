Return-Path: <ksummit+bounces-2048-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E53F7B1B91E
	for <lists@lfdr.de>; Tue,  5 Aug 2025 19:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 439267A256A
	for <lists@lfdr.de>; Tue,  5 Aug 2025 17:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BC5292B36;
	Tue,  5 Aug 2025 17:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="fTcrE2gW"
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7E81DE4E5
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 17:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754414253; cv=none; b=CvefXGTb+IU8CP5deFZ8ZcQroqT4C0Iuxcwe0y88xerYiDzF2P/y0IhMT6cvWt9SxJ9yjvBeLRrXbdSy5SBISFddT0zNYYiKn1U8JFWBiqOOIYJneyq+W3Sr7i4Nz7J9Wg4IL4kwbGTXBwvmCKoJW88ymJjdBZxdgNbmiTLc++g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754414253; c=relaxed/simple;
	bh=XyLdHihx0ceM2bMf9YbbqfZP/FqhEkCBvULhOyNjgcI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XUKVBAQJyvxKJIWMNXNjecSn1gC9yIRT4s6hPwfgH+pg/e7UAZ0HADN25SJP82e32cYa882HCNGTa8aE1PUMTcbb4tWDIb/RaXI/7/a3pKahQrItf2FVlPKbOLFKtijWyIsD4QkDkZft/x/Ex54OmmmzpK01BxjxlMadbDTadmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b=fTcrE2gW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b794a013bcso5044288f8f.2
        for <ksummit@lists.linux.dev>; Tue, 05 Aug 2025 10:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1754414249; x=1755019049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhbKC5bHgMQ1+RoHKuFt7zlJpkg486eF0O9TfDWBhn0=;
        b=fTcrE2gWmVFNW6KPYu7uYurHMetCZRwKIf0P55SRPNUuB1c/wwPtAqtsNdIXfCb0aV
         JqvOVIM677P+1Xwpi1iFXW175X1XED3vvVrupHw9L98Nm0zMBCRnlO3r0UhaBzY3ZBEX
         JYU7dEmzwchL8+JX+S6HGQ3ahL/Nolyt5iiYzIrq2zCGEvAM/KXVN48y+HD6twZ2UzfM
         H5lxeSciP2trpIPbgeN5H6Fr9Vzji9HpqWaprg+hN11OhS40iEB+ahlV6E1u1YOAummH
         MgVFX4zcU+jyVi3Elbsk+pbexFDkB3lLjs4yq3VMCbNjw8wGAB3NVxi6zShf3n6+R0JO
         d2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754414249; x=1755019049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IhbKC5bHgMQ1+RoHKuFt7zlJpkg486eF0O9TfDWBhn0=;
        b=NVHUZ9u1UFFgXAtmJ9CJmTNN51HLN1lFhAPy2dfEw6rBXvbS8psAyPqP9j1knCtBGW
         LQDOIOouuW9027pLvOLLb9TaQWph32MO9COsovutMAZKoWd0CbJ8DOeag1kAA6QqZgRA
         miaE+vBosG1y2Nqr/gIAS9PaiaATTT3FbCV6HlwrTCfzA/diZmsiU+oMQegUf85fqRme
         WYNF96T9R2AsnCL8FBlV6qrcFKhSx6shy7jnrpkANs5ueK+3BBI4SK8gcTz1TXLRnqrF
         YiX+36jfoRsJGM1sw7rBSmTIydNiQYOwOZzo8w9KqDTQ2j10U3GZgqjE9nJteKrXIFrA
         QPtA==
X-Forwarded-Encrypted: i=1; AJvYcCXLZn6reN+JVLIBU4JD9zjEzoK7mDllr6zqobT+uwLJ+dfcDg0j4xHjJiw3pl4p1yFx1j9im75e@lists.linux.dev
X-Gm-Message-State: AOJu0YxlwnsVnAXr91FP1xTL8gR4vOkqpLKEBBeryM+8Q7sYke2r48GL
	xntwlXENDXJP8Z3Ukdnr4NTR8EfxKW2VqsG3BrXDzhoCzU1kyXCWscG56P5jvagUyhc=
X-Gm-Gg: ASbGncv7MWzT8bSqVutenvk3VX5BmFpRyPEx8CEfa6/n1nrCvQLZai1g/9rrjF0B4cQ
	cMEyRWa6F+lFCBwqZZIcpGayrn5G0qRALpcyEF/ZsfuJme0E4XE9Qq9Idk+mNt1uAaDX9ikTroO
	0U1iU8LzCIGjqhHrKjTZSIHnyAN7i0m7ojnQX+BFF/5A0QBFMBkaExaS3xvvHcp3vCU7O3rtwep
	+d0MID/iRuarnG7PbbMUVvpufIPZC70p5svslxp3xE004yj25Xyk31RNtE6YgR7O/WI987wi/AE
	sqJ9ZDfDNehuMLPZ+LrSvTyqHId3Iu7dHY29GKc7J6wCNIvGepwVKCX8n5uXWrLcxUcfz6gSqu2
	FSAYIK321WQPmk7tjGnaNSfQC3enFvgbdu2kuIowvZimFZeH0lKubbsxJ853XxKLnMo6h/ek/iW
	c1ZfwNee3K5Q==
X-Google-Smtp-Source: AGHT+IHhRxB4JoKCMy/ATBPtrZ1y+lMznRE1kagz2Vx8ie50AUKAcsr/bYCGML9FfhXZepadxr4I1A==
X-Received: by 2002:a05:6000:2912:b0:3b7:9d87:97ad with SMTP id ffacd0b85a97d-3b8d94bc889mr11086893f8f.37.1754414249262;
        Tue, 05 Aug 2025 10:17:29 -0700 (PDT)
Received: from hermes.local (204-195-96-226.wavecable.com. [204.195.96.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953cfeaesm276253335e9.16.2025.08.05.10.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 10:17:28 -0700 (PDT)
Date: Tue, 5 Aug 2025 10:17:23 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <20250805101723.2f87fdfc@hermes.local>
In-Reply-To: <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
	<56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 05 Aug 2025 12:43:38 -0400
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> On Tue, 2025-08-05 at 17:03 +0100, Lorenzo Stoakes wrote:
> > Unavoidably, LLMs are the hot topic in tech right now, and are here
> > to stay.
> >=20
> > This poses unique problems:
> >=20
> > * Never before have people been able to generate as much content that
> > may, on a surface reading, seem valid whilst in reality being quite
> > the opposite.
> >=20
> > * Equally, LLM's can introduce very subtle mistakes that humans find
> > difficult to pick up upon - humans implicitly assume that the classes
> > of errors they will encounter are the kinds other humans would make -
> > AI defeats that instinct. =20
>=20
> Do you have any examples of this?  I've found the opposite to be true:
> AI is capable of really big stupid mistakes when it hasn't seen enough
> of the pattern, but I can't recall seeing it make something you'd
> classify as a subtle mistake (I assume it could copy subtle mistakes
> from wrong training data, so I'm not saying it can't, just that I
> haven't seen any).
>=20
> I think the big mistakes could possibly be avoided by asking people who
> submit patches to also append the AI confidence score:
>=20
> https://learn.microsoft.com/en-us/azure/ai-services/document-intelligence=
/concept/accuracy-confidence?view=3Ddoc-intel-4.0.0
>=20
> So we know how much similar training the model has seen before coming
> to any conclusion about the value of the output.
>=20
> > * The kernel is uniquely sensitive to erroneous (especially subtly
> > erroneous) code - even small errors can be highly consequential. We
> > use a programming language that can almost be defined by its lack of
> > any kind =C2=A0 of safety, and in some subsystems patches are simply ta=
ken
> > if no obvious problems exist, making us rather vulnerable to this. =20
>=20
> I think that's really overlooking the fact that if properly trained (a
> somewhat big *if* depending on the model) AI should be very good at
> writing safe code in unsafe languages.  However it takes C specific
> training to do this, so any LLM that's absorbed a load of rust, python
> and javascript from the internet will be correspondingly bad at writing
> safe C code.  Hence the origin of the LLM and its training corpus would
> be a key factor in deciding to trust it.
>=20
> > * On the other hand, there are use cases which are useful - test
> > data/code generation, summarisation, smart auto-complete - so it'd
> > perhaps be foolish to entirely dismiss AI. =20
>=20
> Patch backporting is another such nice use.
>=20
> > A very important non-technical point we must consider is that, the
> > second we even appear to be open to AI submission of _any_ kind, the
> > press will inevitably report on it gleefully, likely with
> > oversimplified headlines like 'Linux accepts AI patches'. =20
>=20
> Oh, I think simply accepting AI patches is old news:
>=20
> https://www.cnbc.com/2025/04/29/satya-nadella-says-as-much-as-30percent-o=
f-microsoft-code-is-written-by-ai.html
>=20
> > The moment that happens, we are likely to see a significant uptick in
> > AI submissions whether we like it or not.
> >=20
> > I propose that we establish the broad rules as they pertain to the
> > kernel, and would like to bring the discussion to the Maintainer's
> > Summit so we can determine what those should be.
> >=20
> > It's important to get a sense of how maintainers feel about this -
> > whether what is proposed is opt-in or opt-out - and how we actually
> > implement this.
> >=20
> > There has been discussion on-list about this (see [0]), with many
> > suggestions made including a 'traffic light' system per-subsystem,
> > however many open questions remain - the devil is in the details.
> >=20
> > [0]:
> > https://lore.kernel.org/all/20250727195802.2222764-1-sashal@kernel.or
> > g/ =20
>=20
> We're already getting AI generated bug reports from what I can tell.=20
> It would be really helpful to see the AI confidence score for them as
> well.
>=20
> Regards,
>=20
> James
>=20
>=20
>=20

I have been toying with AI for some things that got stuck on my TODO
list for years (like writing tests). Have to agree with James, the errors
in that code are not subtle. Mostly they are things that never work because
AI has no context about what it is doing. Especially when porting between e=
nvironments.

