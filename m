Return-Path: <ksummit+bounces-2295-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ABBB42505
	for <lists@lfdr.de>; Wed,  3 Sep 2025 17:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA9F86840AA
	for <lists@lfdr.de>; Wed,  3 Sep 2025 15:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9E2225A29;
	Wed,  3 Sep 2025 15:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMT2q+eo"
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069B2224B04
	for <ksummit@lists.linux.dev>; Wed,  3 Sep 2025 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912983; cv=none; b=gFa4sCzY8e4TKPREpZzWHg7xu2p3mKvfMFSvFdIMfCbgKXkB9Yh/jKJTfpGOk6RJu3RrZ5la0buj0rGjhiItlz8IU8UnP+AF+2X4akDeH4QFhzVV/UnbbFf/wfUllmQenTLyzcuSJihvUkTEVSJS9O58tzsiPaBrCQqy3WRmnzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912983; c=relaxed/simple;
	bh=DRqRsdGI2QjzNoSdniWIsQFCTY4AzQlVFo68JVENFAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NodURP8gHsr+7Vg73cE+LNoIrzoqHXUeDM5xyzh7c9C6zntlWlReOiEj6KQ5cwHcfc8C9keonO+CT7i/e1/KH/SoZ49zlxmS6/aIlWh4paC7V9937UEORsgn4E1Go2+SXoBm6r9okpLrfHSXvpuAV3APdcxp8WGno+Jdl8yQ7t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMT2q+eo; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24af8aa2606so85245ad.1
        for <ksummit@lists.linux.dev>; Wed, 03 Sep 2025 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756912981; x=1757517781; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRqRsdGI2QjzNoSdniWIsQFCTY4AzQlVFo68JVENFAU=;
        b=cMT2q+eoWzA6VJyY8fueLJARV0kpToQgjyOXhJxS2yS3GBBmncbA7B7lkPY9Irn5v5
         JuIjC2YYAMomDijy0CjBpb5jGWWXrgUfsGNeh9Y39BJtdtc2+P4BRDBwqwPHxFpce6rN
         F/g5yK6kOK79lFUYwgVEB8lDEfP9/WtzgAhoutMxD0fOOIbkJkNHRC/9emk8hol3+UQ1
         P9ncfWywjlFtSxpCtRfza/E3wakjrngvWWzAVrZQa/8/Kanzs9YHUbOzGLV9T0HWyOLO
         Oo1WMwRiUSxz9g+LkVt/4aVc7ZnO3LbvEnoC9oh+1BQL+jf67KBRoaUb22nshHk4TWL5
         b1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912981; x=1757517781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRqRsdGI2QjzNoSdniWIsQFCTY4AzQlVFo68JVENFAU=;
        b=wAslPhFbDG/hiRgr4TnwnaVB//efMedEpae1qhYJT7yAjiFkLMpUY/BJizwVORV7G/
         HYNO7fWkys+ASOz4UzsWhKGmuN0nKUgudvZGjemihHKbz/3pDLaSaIj0acjXBXkZRZ8Y
         r7N4jB9ipyj2uF1aVrkAO+26zRFfu2gLYq9hjcnFVbwgfuUx1iViCh/lru2dIhHMmcMM
         6N0zrOo5i9pPgdizFuW0fwfCRyGvhWSPaDmfLU0oZDitm0IpQykPkQoxoCrrW6+Dqxb/
         01z1be5tJ+038QDvvWjRjTiY0BJVh/LQcQSE5XrknxvhkMxAkP/rB6iEFKZu9k5swiqj
         aLJw==
X-Forwarded-Encrypted: i=1; AJvYcCW3SZDYr6Xku3VpCBGnZt4FaR9wfK4ynXXR9gQzsXZBi95Cbcw49LDCBp4JtZQJ13V48IOWINzZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6OI32FWh8/CqcEdzbF73vNX26pj9VLEevHgF994037NyQ9WwE
	1Ho1xMESyVyyJX1phxhO52BytIEcaj3uafxWDzVS5q7iLuEQ8jLf0U+GrHSrzBQrv0Mvq0hFLLD
	utnn91Ad4H2oVfYDLMlalpA7FigJ1ep8=
X-Gm-Gg: ASbGncsi8tX5dTq2ieGnfhMq/B/AAZYT7SvBUpqRjn1mZnhmZDZNOREkEG+U1SeKcfW
	C6OVH1QDzUCequOHzbV6VdQdjKR58cUiQJGkY0/FOq84TpyVs0cKO0d3RDJLVea3MTIv7qQTww/
	z2FhfQXSqKZF0YOXsYBvCz7tpBNmaxl3jaVyeV/TZ0eTLap1OJ1aMKFerVLW1d6kCjEoslruq1w
	ICpn2uM55qCC+GDEf4m+MJd8BuviyOHEkZ4dy+nlKknecVDCbluEy3gmbKCLg0Tc6EzQaDK+Gz0
	Vrd+JubVOAuGPHbKbzemZIhuI/OTrnkDTx3q
X-Google-Smtp-Source: AGHT+IHFm3/iQmvZ1V0Eu9tc93BSM8sUYNm54UaZC5/CwbnsV+UENfgNLgusC84WuZFBviqKy8wjw9fxH1dS32ySotM=
X-Received: by 2002:a17:903:1d1:b0:248:cd0b:343a with SMTP id
 d9443c01a7336-2491e0f807cmr140414145ad.2.1756912981211; Wed, 03 Sep 2025
 08:23:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <8339a5dd-446d-4717-9d68-983f5e2354b3@sirena.org.uk>
 <xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
 <87ecsox4uy.fsf@trenco.lwn.net> <20250902191929.504977bf@foz.lan>
 <87frd4vfys.fsf@trenco.lwn.net> <b20224870cd266f93e11ed8ac75c9e77478884eb.camel@sipsolutions.net>
 <20250903124229.332dfeae@foz.lan> <431ce4a26d70de6b6d63778e62b732dc035633f9.camel@sipsolutions.net>
 <a88f4cad41b2b0930f2cd486dc6c2ffc64300fa6.camel@sipsolutions.net>
 <xxlm3ozmpel5iadhtambkzfx273oysjraffcizdmgexzhuqtwf@qxkwdvqmbadw> <20250903150729.GP3648@pendragon.ideasonboard.com>
In-Reply-To: <20250903150729.GP3648@pendragon.ideasonboard.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 3 Sep 2025 17:22:48 +0200
X-Gm-Features: Ac12FXwN_tZXKtfRO7KZPDHRbedpKbASLbs-zNL0mjsFMzURym4LNhE7qF7tiUM
Message-ID: <CANiq72kQGPciacU6hMz5ePxafy9hk9yL7nPf7s-4RJ7vJBB=Lg@mail.gmail.com>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Jani Nikula <jani.nikula@intel.com>, Vegard Nossum <vegard.nossum@oracle.com>, 
	ksummit@lists.linux.dev, Linux Documentation <linux-doc@vger.kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 5:07=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> If you really insist you could print a message telling
> the user there's another Python version on their system that may work,

There is also precedent for this in the kernel already, e.g. for Rust,
we do the warning thing (or error) depending on what we versions we
find etc.

The user is the one expected to fix the call to `make` and/or fix
their environment if needed.

Cheers,
Miguel

