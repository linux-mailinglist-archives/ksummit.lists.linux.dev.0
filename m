Return-Path: <ksummit+bounces-2490-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 022CFBCE186
	for <lists@lfdr.de>; Fri, 10 Oct 2025 19:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 36BDF351F2B
	for <lists@lfdr.de>; Fri, 10 Oct 2025 17:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002C21FF7C8;
	Fri, 10 Oct 2025 17:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csx+GFbA"
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CD84A02
	for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 17:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760117607; cv=none; b=Ae8VyNXndcda0sRvZPic8dtWCGcHsksEy1aZs7Y8QWAJZdXaiu+Ar0xpzbcK7UUpira3IuI+/7oGd6mwEND5/eVrIY7K3RigVEXxyP9X0CY7vCJlhwkwwEmp8kNZLGSQi4dVp+XMlogmI6/Qri2sWWwpNfF7l/IhUWNwhGvwWZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760117607; c=relaxed/simple;
	bh=JDITWbz3bka0zaWdpOkUbe4NL6DN7wJJXNfhYTn2JbY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=JSD1MGlWx8uTEMGZZL+dph4XoDze6FP/ZGxVp6rbb4U36ofK0r2LwG+ct79fi3EdrD3GnXa/df0X1qHNVCbtqAoOMgB156EmoWp+YOM48/iMhqiS7st7lchvmoQcxk0xVc1MrVQgvjR9wIuG7orI4s/FHdWQ6ZwzjSJCcpj4cRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csx+GFbA; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb7ae31caso436519366b.3
        for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 10:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760117604; x=1760722404; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QRhst6Y8qCK8ClLPbmcErrkOt5afkekWuCHvc7Fv0p0=;
        b=csx+GFbAgsVQj7iYJs27kar3g13/QIMf6Mbn2gKN3QXytY+cOi8uRs74TS8NyDC1AW
         jZEV+N9vWsj/Nb92nqRlYsNpkOaU+W/xe5tG9TwHiyg3lvFWHSIj6fJqt0DkLQOLIUP5
         5NpeWkf+iDOnOOgAuz2raB/sQIJR1ETzdgt5Ly7EKLFJi5PW8yksofNMO2TFmPD5K2Dp
         Oy+sjIgIYes/6qKZDv+Q60+XOnym0z3RkC7K67BRejPRd2mSKmiH2tKytK/wCjxrdHAj
         QqaeNVnDVD5eXSS0r+ibBFHGUHdGDwYCmRcH6/io1ml877oVs847KjE9grZXVDo8rHH1
         tc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760117604; x=1760722404;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QRhst6Y8qCK8ClLPbmcErrkOt5afkekWuCHvc7Fv0p0=;
        b=TJyPP0GIrxU8MAtHqI0VW3Otqn7Fcd4rwp+BwFkXJwBzqPcEgL/4oLNaDNgSeKuZib
         48PSVckzTXyKXXBBOZ7SBJA99Vkcerb5RhJ349/MOF6fFycBCUDTwyWx1ktm7n13J+el
         QOC6ZAt8dbDKq4WwkdWjXQbdZ+mw66cd4sWHvlDevHOxLZRmNs9T5MfwIymo0td36eVC
         4A521SCJ1Qki5vcwP7Emg/NzPrvSFEDmStHBJFVZ3qs8gh70W6w0zRhj08lsIBc7OoYy
         QExRiAftyNIqhqIKhEcR76gG6ADDW+Mz2YkNYHerugWDIWzmOWApdGA4Vql2WWTFcrsQ
         jYCw==
X-Forwarded-Encrypted: i=1; AJvYcCXlCvqVjY0/rj06fkpCIvEH/5gbhgxv72iKHJmsdsTvqbXdj5FVDcFM8Eltyv0caBPqIGYQhpal@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo3XVr2BTD6VMdA7r1kpiL2kl8/coz7uR4FhU3HFnKzX4AXdJK
	cquNO+mm2aQPJ4Wxgyh4ctNgXx8XWtI94hBkwRLA1lTgsQnbXq+BRyPd
X-Gm-Gg: ASbGncvKumsIQ4D6fKxAAgQC3QzZE87pEgSSjMsLBsx+UHzi6asS5JEmiLRCXhVv7MD
	Y6B+I8LmMxOhFXOvaGdYYix4RkGcYuQGoigqJzv2en1/sBqIwCLBwj48HX60zE7CDGYe69JrQgD
	2ma2+q+vvKNQYGdflp+Ae2eynOdnlO/97P5rclOyXmMXMIAPGtWCVsYNZgG3HGkPYZWoasy38tw
	MG1MOMQ5QpFkg8XdQgb5NPYNNp0BUG1I/uzAZlY97oVyEM6Oa+mk9zmDL1P3khFjnxqrDV5vkIs
	8eDZF0Fk/2Z7dIGQdRWfH99bvRik9Tn9JMtXFAe+CMgpE7vhA6NKDtlVd3tY5iMDjC2g2Bfk2ii
	g++6eQadgq+kXNCm4VHivIysSMg9q0uZCwLDPAnwSd33jETJoait+6FZG3E63SHLTfFvmbvkggf
	R/3Q==
X-Google-Smtp-Source: AGHT+IFene4n+ng5HJWv4Y03oilnFBwrFWD3WNj+XOx/oHWR1s3mOSxFsYRlibNI4h09b5C0aGusRg==
X-Received: by 2002:a17:907:948f:b0:b3b:d772:719b with SMTP id a640c23a62f3a-b50abfd5e85mr1338623166b.41.1760117603786;
        Fri, 10 Oct 2025 10:33:23 -0700 (PDT)
Received: from ehlo.thunderbird.net ([185.255.129.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c132567sm2781951a12.33.2025.10.10.10.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 10:33:23 -0700 (PDT)
Date: Fri, 10 Oct 2025 14:33:16 -0300
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
To: Rob Herring <robh@kernel.org>, "Bird, Tim" <Tim.Bird@sony.com>
CC: Joe Perches <joe@perches.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 Andrew Lunn <andrew@lunn.ch>, Steven Rostedt <rostedt@goodmis.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Chris Mason <clm@meta.com>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Alexei Starovoitov <ast@kernel.org>,
 "Knut.omang@oracle.com" <Knut.omang@oracle.com>
Subject: =?US-ASCII?Q?Re=3A_checkpatch_encouragement_improvements_=28was_RE=3A_?=
 =?US-ASCII?Q?=5BMAINTAINERS_/_KERNEL_SUMMIT=5D_AI_patch_review_tools=29?=
User-Agent: Thunderbird for Android
In-Reply-To: <CAL_JsqLM4P+x4iE0DnuKoWfwiMEZjM2Z4D_gcU5HHk9qNUYFsg@mail.gmail.com>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com> <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch> <20251008192934.GH16422@pendragon.ideasonboard.com> <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com> <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com> <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com> <20251009091405.GD12674@pendragon.ideasonboard.com> <20251009103019.632db002@gandalf.local.home> <d4eabdd0-dcc4-4e58-9217-9a8628f4669c@lunn.ch> <20251010075909.GE29493@pendragon.ideasonboard.com> <MW5PR13MB5632C7D79221CF57565DEEF2FDEFA@MW5PR13MB5632.namprd13.prod.outlook.com> <739c7a03558c3c8642fc6a51de4d679ecd389365.camel@perches.com> <MW5PR13MB56325771E2CB01118E02F6D1FDEFA@MW5PR13MB5632.namprd13.prod.outlook.com> <CAL_JsqLM4P+x4iE0DnuKoWfwiMEZjM2Z4D_gcU5HHk9qNUYFsg@mail.gmail.com>
Message-ID: <930B1323-9587-4988-9FC7-050E8A3DA8A7@gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 10, 2025 2:11:43 PM GMT-03:00, Rob Herring <robh@kernel=2Eorg> =
wrote:
>On Fri, Oct 10, 2025 at 11:03=E2=80=AFAM Bird, Tim <Tim=2EBird@sony=2Ecom=
> wrote:
>> > From: Joe Perches <joe@perches=2Ecom>
>> But my goal here is to have checkpatch issues show up like gcc errors -=
 early in development,
>> as the errors are made, so they never make it into patch emails=2E
>
>Running on the source wouldn't expose things which only show up in the
>patch=2E Missing or other S-o-b errors, missing commit msg, using 'This
>patch/commit=2E=2E=2E', etc=2E I think it would be good if we ran checkpa=
tch
>on every patch, but start with only checks with no false positives and
>ones every maintainer agrees on=2E Then we can add to it from there
>perhaps enabling per subsystem checks=2E

There are so many simple things that can be done to signal people how to p=
repare their contribution in a way that will increase the odds that it'll b=
e accepted that don't include AI, just automation, but since this started a=
s an AI review thread and this message is about tags=2E=2E=2E

Recently a member of our team showed me the review comments from a LLM, Cl=
aude iirc, and it , included:=20

Submission Guidelines**: =E2=9C=93 COMPLIANT
 - Has Signed-off-by
 - Has mailing list link
 - Follows kernel patch conventions

But probably that "Has mailing list link" isn't following Linus' latest fa=
twa, that Link tags should only be used if they add some useful info, not j=
ust the original patch=2E=20

To check if that is in place AI may be needed, I think=2E=20

- Arnaldo 

