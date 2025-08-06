Return-Path: <ksummit+bounces-2085-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C7946B1C009
	for <lists@lfdr.de>; Wed,  6 Aug 2025 07:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0742B7A2C23
	for <lists@lfdr.de>; Wed,  6 Aug 2025 05:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1B11F8755;
	Wed,  6 Aug 2025 05:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBlZG4Bf"
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFE41F09A8
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 05:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754459084; cv=none; b=BdnCd56E/VruNOvzxTnGmSeINH79neuS6u2PO21nulLGcDHBaxuUgHjgQnsGOofwEv+AstF3nWGi2LBkxI3mMCQ6MSYgdK2MeYxX4XuaOTLVBICTwPhNqZUD6aqvXIM50hjuZCukppguXKEcL/4p/+J6oo+ClToYhLTK8QDWfAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754459084; c=relaxed/simple;
	bh=ON0KGQOlNP6M7DkWq2QR1WxDCDvPIsJm/n0gB7GIcrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U7OUxqSuqyK07GvUJ8I1CQiATh04vYBSQXWL1iqbkpETYspTcpnQJLhHORrPOpNLILr6rv2J04aLKW7TyHeHyRzxz4dAzhtm3qMutDqsuNURiCDc3nsaHv24maG/z8N8Apeo+cG71Q8ieqX3tL1u+Uso9KcqNik0jmyMyp4/lg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBlZG4Bf; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3323afe4804so45332391fa.0
        for <ksummit@lists.linux.dev>; Tue, 05 Aug 2025 22:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754459081; x=1755063881; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ON0KGQOlNP6M7DkWq2QR1WxDCDvPIsJm/n0gB7GIcrs=;
        b=fBlZG4BfS/F46ZZbi54IKcMcNroRcWB2UuxZipHvdPqzQ4Eni68kQeX2UAgZmmCpPv
         Yc7AbhPacIAopGRjwOpMO80qcz1k4v87fis8m05hCvQ4WLDrUDmYFBnLk0TVGuGTKl5+
         FGVNwHhQXxEZzhigP6REuz60xAbVaneagxre2RU8Yv0EixFNEG+gEjzmTOy46/0F9sWw
         ONISS4U0J/sZ2v/X1l6opsP/aZu8keBBie8OuiB9fEstiOcMTJJ9XdoIl62pqikhLdn0
         4CEkqk9w1szUKNSJEtntv69OPbMolRf0q6pDzBuvC9PhPgS+5OvoFhX21Q+PCDYZOe+7
         8ZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754459081; x=1755063881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ON0KGQOlNP6M7DkWq2QR1WxDCDvPIsJm/n0gB7GIcrs=;
        b=mqKZ4FpZnE/BtI4z4zEZYnFVUpLgmbYIA1nfSD4q1ZD92aXZMdKxGpmUY6WZt5zNyx
         r9OM6nIvDnYW7+2PCkJDWCFjIcT1xWHhEKP3EeQt9xHbHpaChBvM/sa0ApQR9ZlPalM5
         VTW2WHmvB2Oe34+HPlzxH8aZ26+g0A5irqbK3LfIQIlSM/uQcd+PqNRNYoOzWac6Ji7C
         e7vCe+7E1mJULfUtquT72GuVqiaZjsltVJxyeLpE4NjCqA/QWCerisdIfQlf1kHd37tp
         KLmb01Fq9uiM8CccwJ1NBIr6fpZmAFy2a7sipBADocx0Y97ZKMKo5cUZFBjfiqoHuH1w
         MKLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuF8EYYmtTjBa4U+D2zwPk5XsMUHnYs20KwYeSrYujqmCnd0OUWk/eTOWonAYBcAXUYssmUqYj@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ7nA4ONehaibCrcigl5vplLX5wCTtcA5G8yewQu1HYkn50QgS
	6W1EvJFFux5Q0UN/K4s13JsQ8d6Nm/iWG3hJ/4DjyQfMozKfmAHvoDEJcMy0jgG+Ka2O1VJ9aPh
	t17LC8NR5iThJ/TSXF3BXRNS/vDifcdQ=
X-Gm-Gg: ASbGncuTKDDuartHHNN1n+oZPb2HkcIfJvTr49JQI4hnjX9nQ4Neh9ypvZGk4jez21/
	FkdX8VVnWBXMkl76SQjYXMX/OcPJCMPoSiA+X5+6GSL0fz/tFynHLEVhgLyVdCmFQGNlLi7b/3m
	0v+M981tu2eayKvuy12ElApXy43AC8ooRAC4b79t5gj74MBAnoZmASkTcJ1u4qPMeBcj1na8Lte
	iT2U0E3ixYKBokaiB0eIDIIIDRhoiM6wnfi
X-Google-Smtp-Source: AGHT+IEtQqxvrDS9VOxitwf7Ne63YArrE4ZTy5eED9HnqaswUXiE363l5/VoXIzHYA19tz3xHvhECR2QcvJFKfMLfyY=
X-Received: by 2002:a05:651c:3046:b0:332:612b:6f46 with SMTP id
 38308e7fff4ca-33381438488mr2989731fa.35.1754459080708; Tue, 05 Aug 2025
 22:44:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
 <cb91ddf05b9ea48056765a9027ff9132e080df30.camel@HansenPartnership.com>
 <2025080515-grandpa-prankster-ee83@gregkh> <p1886464-9p9n-4p0r-52r7-70sqprsoo32q@xreary.bet>
 <yq134a5ctxw.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq134a5ctxw.fsf@ca-mkp.ca.oracle.com>
From: Tomasz Figa <tomasz.figa@gmail.com>
Date: Wed, 6 Aug 2025 14:44:24 +0900
X-Gm-Features: Ac12FXxXRr3fv4jdWYrOVgEvshW1WwKX_mIJAXbMg9TgVKjs8UCFV8EevhwDpYA
Message-ID: <CA+Ln22GMO2rz7FbRwQor_dtw=x_v1iXS1kmTCGv7rcbMUu2BBQ@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Jiri Kosina <jikos@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2025=E5=B9=B48=E6=9C=886=E6=97=A5(=E6=B0=B4) 7:34 Martin K. Petersen <marti=
n.petersen@oracle.com>:
>
>
> Jiri,
>
> >> You can also filter on stable-commits@vger.kernel.org, which is what I
> >> do locally.
> >>
> >> So filter away!
> >
> > The question is whether it's really worth all the e-mail traffic this i=
s
> > generating, if people are just filtering those away.
>
> If I explicitly tagged a commit for stable and it applies without any
> problems, I would prefer not to hear about it.
>
> When I am micromanaging a particular patch (critical bug or security
> fix), I am much more likely to be poking around in git instead of
> relying on email notifications to determine whether it has been applied
> or not.
>
> I do have interest in failures, however. Obviously the patch author
> should be the first point of contact. But I do like to get copied on
> backport failure notifications. While I may not act on these, I do like
> having insight into what is going on...

Let's not forget about the autosel patches. Sometimes the selection
doesn't work very well and ends up picking patches that shouldn't go
to stable, so for those we should definitely have a way to learn
about.

Agreed, though, on explicitly tagged commits.

Best,
Tomasz

