Return-Path: <ksummit+bounces-2752-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 78275D0B485
	for <lists@lfdr.de>; Fri, 09 Jan 2026 17:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08C68300DB91
	for <lists@lfdr.de>; Fri,  9 Jan 2026 16:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D896364046;
	Fri,  9 Jan 2026 16:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VO//QE//"
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB5935A956
	for <ksummit@lists.linux.dev>; Fri,  9 Jan 2026 16:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976432; cv=none; b=rPCwY1+7OBbwZf55tirMPqE9tXdjfYL37Ops+TxR/OSxzNwu/YBM/+EIUEkCdz7t9iJrOZm90ZH55yWKFiGHAiwjLbMsNhXWWGr0AaZP2AxNkwc4bEyt5xOixP3/7LjEDlp+ebs8m5SkQ5dwcrZJmDkqsUlKxaAb5YpjZfmoA64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976432; c=relaxed/simple;
	bh=uv4N8WCxqirDaDiJi9ylGK7eD5jNkl62arIAHY3Au4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cc35Ph58YWCRJi5Uk8fUQU8rFDfZ2HJq0mlHDwPoP4bO5r+ABDGr3i4QvaTXmR7oOemqm2S8lkYI/WXjpYrvZeRrVz7810UEQabL48QYB+PXcXurcOV5sIc9voiRTGt70dOQoSxXj0a5+E81RqdMe4okidNN9ip/kQAn9t9243A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VO//QE//; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b1769fda0eso80213eec.3
        for <ksummit@lists.linux.dev>; Fri, 09 Jan 2026 08:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767976431; x=1768581231; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uv4N8WCxqirDaDiJi9ylGK7eD5jNkl62arIAHY3Au4A=;
        b=VO//QE//yZ/o59sj41dB0uM6V579+a0+SAmzHIJEerlC3++/6Ij3F9OPEdKLc32u7s
         piy+SUhroyeU6f0KqfIwEE18Sl5eHyQE96BXGqUb8Oi81cfY/J56Hwk7Lb++2Qp7HQEU
         Yxt0YrlUErugOZaaAxNOGMCEGPt3RozwSw7C9Fu9LS5DHeNFhi8G2JbnIR6kZaiFsPHd
         COeG77ufa5q+3A4Fejvnd8q19V8UCmKD3FNtxaWPyoplWTNhT4pcNPcuEGVaVb5R37FS
         6n0A2IhLH4M+OTKC8hGM5UKQHh7iKLN7z/R5ErgDAXjDUeKsWWoU4q8Ys+9KU9QsA0s3
         Becg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976431; x=1768581231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uv4N8WCxqirDaDiJi9ylGK7eD5jNkl62arIAHY3Au4A=;
        b=HSMwlWXg4XNdQQ5BLQjunxMEJg6EfGetNxuK/NHbPWCADwth5pu6e6QF485BD0iQeN
         sLqdhD0YAomYwKEua/dea7/26EljSpIqytOYUQZrjTaKAudTwd0NTHQn9QLEUnKQNtuu
         6kOo292fepfUadh5DggwBpmGKFVzfsMO4HHCC3rtDWusCEtir9MHk7i27Hk0wPsfZKnl
         IdIZeU/FhZJwSdmK4piD50RxL9b3aPUDW3MaeP5NbZ5YBJ/Tbe/JjH6M86A6fgw+0d3f
         8Rsz1XnwVEIq4Fby0osRwGAf2QeMPN6C5q+64BHsp4FeDjqRNCVc6UiIS9qEtNvyZ69t
         HAZg==
X-Forwarded-Encrypted: i=1; AJvYcCWpQdnPJY9yHOB1o/JTkg+RPwkcabinbxiDNaa7njMq073tpNL9yK/TTWBOW+OVbRE5mpP/Oxek@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0pPwsAo/DsNLr6OvAShV1Ctsf/hCskZIbLL5/mzQyxsLvumGV
	8qFrAjOHsRuZhTCqnO2421Rq8MvO0FN+KhZbJOpDY69ip/ljgJUIDpgSnkM1Ia3QwAugbfMS13f
	Z99EgNPXSTJlQkPK2oXxsVsWq33pD2o0=
X-Gm-Gg: AY/fxX70vg/aZv4QBdjMG46QetvFUkNG+sB5k+F1DU22V/XMqnRfoisLURcDb5n5Hfm
	WCkY8rZV47pmPvRVpnIrXODL0ZMiy5NUV4gfjwwEqHchCZbxX9Oz4Xdu7DNYVIROd0qnVfLjmR0
	0hI2pNxy+9ovv3YWkZx/+k6NlHpBT/y9XaaLO653pdYpxCJq7fG9vJmapJIEeuTZa3/07QSHVqj
	7RdK6sjc2EQlA/HiB+YW5yt7iJZorkqz3bw79cup4b8tcinmgoZ5rxedmUwdR8uJ6P4n4kNHrZv
	feMVlY1JtEx3ExiwnFzE5swG3ufdS6ZwPLT4X2H0gKl2bPaIKoL+Tz/El1okL+oz+uz4OSZNlVs
	p3nRn3Ojj2mbt
X-Google-Smtp-Source: AGHT+IEjU3/kJGOtPK4YL35P03625mkvXRPZFko4y4f+QMx+9mg7IfKKpLVoOaWxcQHpwaDZ7iBFYlfkuKiPOLyhOs0=
X-Received: by 2002:a05:7300:2154:b0:2b1:79b7:5850 with SMTP id
 5a478bee46e88-2b17d34ee36mr5478630eec.8.1767976430783; Fri, 09 Jan 2026
 08:33:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local> <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local> <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local> <711d9e37-6fe7-4783-8ac4-5269279bb9fe@kernel.dk>
 <3xf3f4b3vegssexoid746y7isuswwsgmac5hy2hm4ipisdcxaf@nbi67byycwj5>
 <aWCSVh6NocePMvp8@stanley.mountain> <0b9a8f99-5cc4-40e8-a0e6-4887d1e1a796@lucifer.local>
 <20260109085446.GA9782@pendragon.ideasonboard.com> <20260109105104.57d308f7@gandalf.local.home>
In-Reply-To: <20260109105104.57d308f7@gandalf.local.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 9 Jan 2026 17:33:38 +0100
X-Gm-Features: AZwV_QjJwaXXKSwiQi8MluNd2x3mpci_pDnE1e-RLQenqw0FAlzgw9Aeuqp5h6s
Message-ID: <CANiq72m0_m4Tcn4YZvw_4cKjqsrJCDcfobLnt=Oai2d8y5FyBg@mail.gmail.com>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated content
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Jens Axboe <axboe@kernel.dk>, 
	Dave Hansen <dave.hansen@intel.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Dave Hansen <dave@sr71.net>, 
	Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, NeilBrown <neilb@ownmail.net>, 
	"Theodore Ts'o" <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 4:50=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> In the TAB, where we started discussing this (and I was
> supposed to be the one that wrote the first version, but thankfully Dave
> did a great job at getting it going). The focus was to be to document wha=
t
> we currently do in practice when it comes to tool-generated content.

Yes, that matches my understanding of the TAB discussions.

Cheers,
Miguel

