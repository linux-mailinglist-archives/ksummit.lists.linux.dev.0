Return-Path: <ksummit+bounces-2470-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E83BCA60F
	for <lists@lfdr.de>; Thu, 09 Oct 2025 19:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AA1F2354017
	for <lists@lfdr.de>; Thu,  9 Oct 2025 17:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0868A23C4ED;
	Thu,  9 Oct 2025 17:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdxw0rRB"
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7E6225A38
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 17:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760031085; cv=none; b=Il3ejHm/b7Ae2ObJxSnseCO4kJXWm+8KG0GL/JCam224NNYS/IPxt/BKYzAWLRFYZfxeFduO8ca+IljKHk3unFPJxOT3Hj5bwsf67DeWeC0sywQNcPLFQD2rWlS7uM9JMNo5L1H3rmtEx5mCZJXlThQ20j2SAHWrBPS3j+Tez/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760031085; c=relaxed/simple;
	bh=k0lzDJI+64Fh5bjTU0AHfYputydnsIvgg0oaaMhpmYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbNGd6JvKohTP5Y7Ue1TKKs9GiVwA1K1e6R2+s6xoU1jMIgMR9IcLUMRqq2rkh2gRzZLG81/wIE1yackujuNE2RndrONkePJXFc2msQDcxdb1a///WTDGkAW1SzDr7WYEjLJuIlmhUpjeGh2+TRUVzIt2kZJweegKJ1QW5HQOfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdxw0rRB; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso1160771f8f.0
        for <ksummit@lists.linux.dev>; Thu, 09 Oct 2025 10:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760031082; x=1760635882; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0lzDJI+64Fh5bjTU0AHfYputydnsIvgg0oaaMhpmYo=;
        b=mdxw0rRBTErixFWlpoiARjgLEXmBHiakJd21Xskf3tvLCYBNVsGBXwb8ZIdq4ceArg
         Zv2uvChh1I8+9yztvxRntnmVmvb19RpiNPs9K9vNo4i6T0s6KExCjbosdRuu20MnscYT
         wtAdSmmf+I5RdbJyKSeIwDaegPR3+wEHZLK2iV74lhgKMAwBXIpMMaX/hslNma46SMl4
         fsQ1/a8D21hU2jyTxNq9cfp+Y9dc5Usp1ZD9RG60rKGWAT7xPTXui+wEbuxYk7ZjykOW
         3nlhrytER5C+Itz7SwMzbi7tQKnshEs1F7+QtK4ymUdYMxjjlyBmU+wXguWNaRAUS4O7
         D0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760031082; x=1760635882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0lzDJI+64Fh5bjTU0AHfYputydnsIvgg0oaaMhpmYo=;
        b=ESC01u/oTt20gV0gHe4yi7dHyrxMFFIyz0Eb+AGO6ayzOZ7oUf/gusRXWbV+yI/GZj
         R+B7HE23AV8679jwJP3jgSES2BNKRChzsQfpeqWnJcwf/BCHwIqwAzlG3BRYPZaCyqTV
         MOrseciu5/g7rJKfiKLtXBPOKIWheTvrhIgNg961UO0W26bB+ekJn8c+PPdWeCDRs/fi
         PqH2CMLE1sTRLg4uGWu934akPigy5u5UomClIihLKeie2BGOvTXggFB1FbxVI9MjmTUZ
         JNbMp9t+02SEnafXQ61JxcHmFyshRVVh5DZ5Cqkw9N4sfMzO3URwXhNHZk8WfK+2wPSU
         P4rw==
X-Forwarded-Encrypted: i=1; AJvYcCVLf7FH/mxWbXTkYQeadcQAtEnG4Ggl4ZXFrqOKuiJATnNWA0z5ljN+SH9uL/0qUCGShZCgAoY6@lists.linux.dev
X-Gm-Message-State: AOJu0YzZe+W/QNCycGA1CjH8Cn5re/eh9fQrWPWV+ByhCKIN1Hmes+BF
	QQwUnPZha9rneUvT0WmT7Ub+EXkzxQyVZsLUjGxbSCe1DAFsZnf1KPbuBLQjmRsdY+1N1e6QIZK
	EITiNdG6enCdKnMzBIJZSQKj14+1ZlpI=
X-Gm-Gg: ASbGncstukAKIs/4xuHdsi0Ay7iP4+GerVQBMB2XaG2NbuXhFb5pcjaKgrTBGzp5s50
	lqA7PozaGaPyuZf3HMdnU8c5tzjExZKrQhZFJwUlHsgb5v11pCBB3gJktA+kBzfE7+4bMRRxnqU
	cEnNMikZ+exD63S9perZAshfBRK9rPeM5XipwUfO3Qj86aSWbmUt+JK7c2GKjo31jG8BQzH7frk
	NyvPyo8lbOv18HMz0tr+9ST5bMzFlI84Nuae81rc+qyk938uvjdNS2qxRVji494
X-Google-Smtp-Source: AGHT+IEy3mk5ENzKFXe+FHseNWj/+hzGFVpITHl/MLfSEoQE8wOCHqs0SCLgXiYI5pIC0iLBaagofdgoIQxq5JVzpQc=
X-Received: by 2002:a05:6000:4009:b0:425:86d1:bcc7 with SMTP id
 ffacd0b85a97d-42586d1c0cdmr6485186f8f.23.1760031082281; Thu, 09 Oct 2025
 10:31:22 -0700 (PDT)
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
 <3f25bd06-a75f-4de8-b8f4-f92dffb62f09@meta.com> <aOfuu8InYEUIZdWH@x1> <aOfvuqPNLtBPlc2r@x1>
In-Reply-To: <aOfvuqPNLtBPlc2r@x1>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 9 Oct 2025 10:31:10 -0700
X-Gm-Features: AS18NWD0ZUHKDOdbQOncQd9GbIYa6z5x4iPv1DOW6P9CBLfrcBEWZ_2BVt5yLQQ
Message-ID: <CAADnVQJjqgrfLo3pcFYDXJ9x6ieDoeJEroWRCSG1cVahH8AMnw@mail.gmail.com>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Chris Mason <clm@meta.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Bird, Tim" <Tim.Bird@sony.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Andrew Lunn <andrew@lunn.ch>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 10:24=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Thu, Oct 09, 2025 at 02:19:58PM -0300, Arnaldo Carvalho de Melo wrote:
> > On Thu, Oct 09, 2025 at 12:31:48PM -0400, Chris Mason wrote:
> > > On 10/9/25 10:30 AM, Steven Rostedt wrote:
> > > > One way I see this working is to attach it to patchwork. Sending a =
patch to
> > > > the BPF mailing list has their patchwork trigger a bunch of tests a=
nd it
> > > > will tell you if it passed or failed. I'm assuming if it failed, it=
 doesn't
> > > > add it to patchwork and the maintainers will ignore it.
>
> > > > Attaching AI to patchwork could be useful as well. But this would r=
un on
> > > > some server that someone will have to pay for. But it will not be t=
he
> > > > submitter.
>
> > > Just to clarify, that's what already happens with BPF today.
>
> > > Ex: https://github.com/kernel-patches/bpf/pull/9962 are all from the
> > > review prompts.
>
> > This almost relieves me from the guilt not to have reviewed that series
> > from Alan ;-\
>
> But this goes back to "developers should run these tools before
> submitting upstream", which would provide them with reviewing comments
> that would improve the quality of their pull requests by using all the
> money that is being dreamed into AI and would saved all of us from
> looking at github, etc, before AI is satisfied with the quality of the
> submitters work?
>
> Its all about what should distract maintainers (humans?), no?

Our next step is to send them as plain text emails, so that reviews
will blend in into natural kernel development process:
submitter send patches, AI and/or human replies, submitter replies
and insists that their code is correct and AI/human is wrong,
or admits the bug and fixes it in the next respin. And so on.

Chris did a tremendous job in reducing false positives.
These reviews were proven to be quite accurate and spotted
bugs that maintainers didn't. In a few cases the maintainer
found a bug and pointed it out, but AI explained the bug better.

