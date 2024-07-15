Return-Path: <ksummit+bounces-1432-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E8D931BC4
	for <lists@lfdr.de>; Mon, 15 Jul 2024 22:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63E2D1C213E4
	for <lists@lfdr.de>; Mon, 15 Jul 2024 20:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9FB13AA45;
	Mon, 15 Jul 2024 20:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/wUEqvv"
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247A3131E38
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 20:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721075122; cv=none; b=ulP9iQybFlain7FGe/BqHtIbzd6W0mb2+J6wipyw0E1UBJroWIVxEyBeFTZF2Tjm46bYDONEkwmtxT+gxyBfEHu2Z8mMdR8f8sQnpqHPLo8Q96Bx617Yh/8LZDLpOvp7HEJNqe/cuXi4rpTNtvHNr0PFsxbzgOtQG2UfKGla6ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721075122; c=relaxed/simple;
	bh=vEhQ1r/9KMSJAQpxWRH/sS6tb+3ktwoMObiGPZgbkLI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GSSlEgDRndr0FGRV0sKRHM32yxzzFKUJkWk6cKdvHeOnqS8VEqiwnXlMs5ylBalYYrFDKWUvIEIJq2ArHk1+LI6vL6t8h3+FOOc4lWGnDvTmrDtQ7TH+YexyeCD54KVPjTcOusMlo4WH6RWieHF+egrux/ACme4Tzdv1/qhfs50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/wUEqvv; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7527afa23cso562649966b.2
        for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 13:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721075119; x=1721679919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEhQ1r/9KMSJAQpxWRH/sS6tb+3ktwoMObiGPZgbkLI=;
        b=h/wUEqvv4oiHHY+wfSAWeHZnTTyiKQ62JPZt/of6Tm7pjeV6Zp1QjuTp8l3MlfhtAg
         vVPwj6rQux7WyAyC+lKVW9xB6lLxjcdqZWQ3e245aC5dqW0El9N6RXb3RAxqNHj12sTc
         8jd1DIGUEs6ex05HvCBJdLBXQTv1fY5bJPVJBdm/1Th5r0mJs4qvhIbKP+hSYGkNu+de
         11yUASdw38aDeRLmTn+AaCV4J9L+2Rb5OI5Mx5JKtNw7P0278lvcihbunOl5hiZ4m/xQ
         DFt3f904pSpAQg0FtsWs8d3inAs0EFqdgCYzmUWT4sRDNB+F7MJZaWSH5vOODM877V0Q
         QE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721075119; x=1721679919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEhQ1r/9KMSJAQpxWRH/sS6tb+3ktwoMObiGPZgbkLI=;
        b=UZmcTDKzfxMtQ5iRdIGZgLfDxPhfkgs4/8+CRDuazcBB4bflV3BvC/80OGdtMEJdR0
         cF3xAPbi+luF0VSBq9cWxQ/dWN5tKzFqQKMYvRqHUJOjcE4csWf6ht8sHmcvVpwaYEYi
         JqpwndQs2phnPIBmTdhsGhz6HQTwXPuWKabyw4+TGIRwqWHJIeO+q1cBBXsy2hhMQxCv
         hkYsAfLqXKzAMlPw+BK7yU6QnsBdJtefnIEanWQd4yjP2Y2ZENKxG8T2n5nI/ykDuPf2
         E5i7C4Fsq9EAhw1Sm8WaKSxTS4+Z2sxvUzRgygTJvGkwJNjT+ZfDhGbOFN+o6b7QqNSd
         +0kw==
X-Forwarded-Encrypted: i=1; AJvYcCUTSS8axRc15z0173IXEfKc3yOCw3XBXTTBRCHS55E1u++8vlW768nd9uLJX+KhxoN9wBIZ41mY9I9q4Wogla9YsEw2tysGsA==
X-Gm-Message-State: AOJu0YxlUoYDruqlipPA3DgA/WH9l7rCAqZQqEXsHwUr0z4JfAYoFgjN
	4OwZEwX+UKq1J52FOXHS50nP4PTO3fS9sb77qBPg6P8rnkfJ1rdO
X-Google-Smtp-Source: AGHT+IFWiTvKIV3UL2oG5MZbw3orbDCJ4BddNVfiXz1p+iXpMOIHdQo15B3EkTpmbAyDZcheD8pQww==
X-Received: by 2002:a17:906:1404:b0:a77:d52d:5c5f with SMTP id a640c23a62f3a-a79eaa304eamr4826366b.51.1721075119077;
        Mon, 15 Jul 2024 13:25:19 -0700 (PDT)
Received: from foz.lan (ipb2184e18.dynamic.kabel-deutschland.de. [178.24.78.24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7ff775sm241611266b.171.2024.07.15.13.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 13:25:18 -0700 (PDT)
Date: Mon, 15 Jul 2024 22:25:13 +0200
From: Mauro Carvalho Chehab <maurochehab@gmail.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Theodore Ts'o <tytso@mit.edu>,
 Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev, Greg KH 
 <gregkh@linuxfoundation.org>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <20240715222426.2ec1f11d@foz.lan>
In-Reply-To: <2d787d2e12b336f94afe5549cbfef4e1e20d9a7f.camel@HansenPartnership.com>
References: <ZpPFJH2uDLzIhBoB@sashalap>
	<915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
	<ZpQbQa-_8GkoiPhE@sashalap>
	<f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
	<ZpQyeLFJY1gJvRRA@sashalap>
	<20240715180000.GC70013@mit.edu>
	<fee1f575-e90b-495f-8832-6735c1917054@suswa.mountain>
	<2d787d2e12b336f94afe5549cbfef4e1e20d9a7f.camel@HansenPartnership.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Mon, 15 Jul 2024 15:24:42 -0400
James Bottomley <James.Bottomley@HansenPartnership.com> escreveu:

> On Mon, 2024-07-15 at 14:06 -0500, Dan Carpenter wrote:
> [...]
> > The one question I have is for patches which pre-date git.=C2=A0 I was
> > told to leave the Fixes tag off in that case, but I think that's out
> > of date. It's more useful to say "Fixes: 1da177e4c3f4 ("Linux-2.6.12-
> > rc2")". =20
>=20
> Actually, we have a history tree (based on Bitkeeper) that goes back
> before that:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/
>=20
> So I'd tag these as
>=20
> Fixes: 3bc0a5f5c1 (history "ext3: reservation info cleanup")

The problem with such tags is that eventually conflicts may arise
with other checksum. Also, people may not notice that the fixes are
referring to a different tree.

IMO, if you want to reference older commits, the best would be to use
Link instead:

Link: https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/comm=
it/?id=3D3bc0a5f5c1

and perhaps keep:

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

Regards,
Mauro

