Return-Path: <ksummit+bounces-2474-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC34BCA9F0
	for <lists@lfdr.de>; Thu, 09 Oct 2025 20:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0C37C35081F
	for <lists@lfdr.de>; Thu,  9 Oct 2025 18:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B12B24DFF3;
	Thu,  9 Oct 2025 18:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iNJKCZ+S"
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3E821FF38
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 18:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760036206; cv=none; b=QF1G2O3d95LKWZxCukszyYP1BZC+Crd/wO6otSXmTgK3t0G20QqcbB6yh3K3jtCa1Dv1JxBMEgEfbssUYkdewXxzvjXpY23+bkGztu7iEHPGHLzIsjzH5yDvn4QWFFR4TgpBHrHXgDyLMjFQpa8/WZ5qYuPxf5y6t007OT97YeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760036206; c=relaxed/simple;
	bh=v8JQyzlPVZaVA0jb+zo0xxxL9mPDQfP44QpLlmNUjKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AAa/t7kPy/VEPp4cjN1THo1x2v84omZ7Uily4ZwKEd8lLYmWBs2Iom1RODlLoXmO0Y7tDE1lgYKy5jjKwqzaDfCL5RXmYSECEvnQ4dfiF4AcIPXYZRwNiKH2tELumcJgwgYiLOdWgYSu5WAIj9RsAhziU/Xo29jNU5nneNDulhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=iNJKCZ+S; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62fc0b7bf62so1925731a12.2
        for <ksummit@lists.linux.dev>; Thu, 09 Oct 2025 11:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1760036203; x=1760641003; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=itWIzPtbpqEuAAKQonI5TOGHANibqCbcc1N32dO0paU=;
        b=iNJKCZ+Sqpk5sKF1TRedLITIzPpmfgdqKImcKvWBymCYFCol1p5R5a2O1/z3aGn/Ti
         +KGpOG5ZaJoFj9V1RThusp7TGSwv4puz0h525wIoL2624GDtSLBpr+ychBuCZgspcwHU
         d8h6/d/DW8YZ4s0zam0B7GQuNSdR/e7bwuC6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760036203; x=1760641003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itWIzPtbpqEuAAKQonI5TOGHANibqCbcc1N32dO0paU=;
        b=v8nhMN+1NFgX+RUvt2j3l1WbwS3Vz1jChoP02vN94o26H+w1XwkzcD1vYXV6PJDTG+
         lxspaq+BCBGou2QiRQylq4Uj4OoJBrOh3bNn7f8lOiOU6/llC3UKKVaBu4ovNc5WE8dH
         hE4I/LJi1+DYYoF6aMtLWabZY6AcBLLfNCnTXUw0BcCE6cmpyXu62rveQKLBlsPhwzO9
         q9IBVzRGOVnzzhGpKUz6eSjy8JYQWLcti0byvAYrHfPl1C/grEXqiU7lKuKofLyAOboz
         1uK3WT0Catp2LZrGesZwkI9qL62K5PctOq+5VGHWgrip8GVkQIY8xZ1mFb/zpPLns+ap
         PveA==
X-Forwarded-Encrypted: i=1; AJvYcCW0hOa4V5xgrjvyhcAJ1gY0tggTz5hzFeQ1TzMDA4IZgJv20PN1nuM1L4gyonlKC15kjIS+nmdq@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu21kQCNWrOLc/6uKRa2gNiYIJqt/vwZZVZvdTtrqSOQPMHY6F
	9tl1Duj9qreYXrLDWGdkh8CUQ2leSL8m4dcKKQZaRK2G7/ckmSwSl/Nm8+VKCZ3A3oGMgt5b5lZ
	WnSY0nRw=
X-Gm-Gg: ASbGncuDfIGmUPoxCONJibQAZLYFuBSZ7F+89nJhWMI6mTALkP1ZSv8a5kyCbH4iCKu
	Ztlwfb+u4jAqdrUsHYMF9kNWhr6+WCXourhln9dZPy3Kme4ezYT+Gj9nWe5N2sArIwo+QfvQl80
	+crA7sJM/ORDrHCBWo2TQer4reevFt3UOY71PfaxZor1/RqMn5V7VlJov5dyQoM1r0v31THmXSm
	k7r2/3Fs8SrrHdqxKnvao7IGUpxp3Ztcfpf4jgzwIHSBmwvBbtJESkR8z8G/hxGWRefR5h2dIsc
	DDYhndfBHNePedmIFbGAVOkLIC9AJzErd7IBP8EV7ocGQf2IiaubyHXc0lkFkE5VmK6fPMdsDvZ
	G0hW5XovVXuHhNDbHApe0mYNLQINuNICeo5md8QbeZ88VIOTDHQLDu0uS6fJ2bGzwtp5zki3our
	wNbC/2uWYiCwfLhA0FW1556tXmTqfmLFYulLGQXl/B2w==
X-Google-Smtp-Source: AGHT+IHbVsshMffFllmECYgUsaeNRfNrhbr30zaF13VQhxlvL94ih5agc44aC7bzwTh8VMSCgGXmtQ==
X-Received: by 2002:a17:907:2d26:b0:b0c:b51b:81f6 with SMTP id a640c23a62f3a-b50ac4db244mr986365966b.43.1760036202586;
        Thu, 09 Oct 2025 11:56:42 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cacba7sm37701066b.5.2025.10.09.11.56.41
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 11:56:41 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso2478452a12.0
        for <ksummit@lists.linux.dev>; Thu, 09 Oct 2025 11:56:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXD74peuHMJEkoI6l+h7eH1FWNl/bKt1Zy9b5hpPkCX+B/+IxszvN7xyXiQLPkJJfE8X6NBCvZ@lists.linux.dev
X-Received: by 2002:a05:6402:274a:b0:62f:3436:a396 with SMTP id
 4fb4d7f45d1cf-639d5c5a403mr7705044a12.31.1760036200824; Thu, 09 Oct 2025
 11:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch> <20251008192934.GH16422@pendragon.ideasonboard.com>
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <20251009091405.GD12674@pendragon.ideasonboard.com> <20251009103019.632db002@gandalf.local.home>
 <3f25bd06-a75f-4de8-b8f4-f92dffb62f09@meta.com> <aOfuu8InYEUIZdWH@x1>
 <aOfvuqPNLtBPlc2r@x1> <72b9b81c-765b-4047-bb3b-40b2a8a6e563@meta.com>
In-Reply-To: <72b9b81c-765b-4047-bb3b-40b2a8a6e563@meta.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 Oct 2025 11:56:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj3fQVEcAqy82JnrX2KKi4NjnEGGSH2Pf_ztnLCcveWkQ@mail.gmail.com>
X-Gm-Features: AS18NWA63wpfx55rR2Ses7zq87PfOBJQAwBQTzbi2tBrV_qthlQoHx95Lj9a-Vk
Message-ID: <CAHk-=wj3fQVEcAqy82JnrX2KKi4NjnEGGSH2Pf_ztnLCcveWkQ@mail.gmail.com>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
To: Chris Mason <clm@meta.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Bird, Tim" <Tim.Bird@sony.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Andrew Lunn <andrew@lunn.ch>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Oct 2025 at 11:43, Chris Mason <clm@meta.com> wrote:
>
> I think it's also important to remember that AI is sometimes wildly
> wrong.  Having the reviews show up on a list where more established
> developers can call bullshit definitely helps protect against wasting
> people's time.

I really want any AI effort to be primarily geared towards
maintainers, not end developers.

And this is a large part of the reason. I think we've all seen the
garbage end of AI, and how it can generate more work rather than less.

We see the downsides on the security list where people use AI to
generate questionable reports, we see it in various general bug
handling, and we've seen it on the infrastructure where the AI tools
cause huge issues.

Fairly recently Jens gave up maintaining his own git server just
because of the horror that is AI scraping tools.

Yes, that scraping issue a "secondary" kind of "more work rather than
less", but it's very much a real issue nonetheless. Just the
infrastructure load is a real thing.

Some long term goal may well be to help end developers, but I really
think it should not be seen as any kind of primary goal for now and
shouldn't even be on anybody's radar as a design issue.

Exactly because I think we need that "established developers can call
bullshit" without being overwhelmed by said BS from external sources.

So I think that only once any AI tools are actively helping
maintainers in a day-to-day workflow should people even *look* at
having non-maintainers use them.

And I say that as somebody who does think it's going to be a big help.
I know there are lots of less optimistic people around.

             Linus

