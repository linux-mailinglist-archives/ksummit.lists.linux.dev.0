Return-Path: <ksummit+bounces-2489-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 307A8BCE0D6
	for <lists@lfdr.de>; Fri, 10 Oct 2025 19:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D5C94E2031
	for <lists@lfdr.de>; Fri, 10 Oct 2025 17:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7687820FA9C;
	Fri, 10 Oct 2025 17:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CenbvNIc"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0627201278
	for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 17:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760116318; cv=none; b=OgKE2IpO9UOsdsqw4pV5ZWea8iyeM+bd88sbrPgNi9ddvSMr7mRvOMmHvCvT9UnMWz+cO49XP1vgIQf5zpp+zcxPnsxkRG7d+/hdi+Arbl0jzwubh9VFdHU2gGM/yfEIToEnnxPRv4uqRYKrL/hKYH8q5jmwpuk63g1MKVmvtA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760116318; c=relaxed/simple;
	bh=94fXzJEcMF+HX61Bz5eWPC9MtmOLSMgSDFBGsd558cI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfZmyMwVFSaLg90YRdLXE0P2OzkiWBJ2s1djtWpb5DjiUmsahKbLBc46wlunLXWO73ZYtpW6No++BKl0+Nb41Xe1zhj9lSBmnOukBGzzsS5ql2s/b8Jl+Dlu7F3LKQBsOlfLItxTVAzMUOFNVBXkzAgzJV6VZ4AIQSUVmGskayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CenbvNIc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64747C116B1
	for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 17:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760116317;
	bh=94fXzJEcMF+HX61Bz5eWPC9MtmOLSMgSDFBGsd558cI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CenbvNIcI5z+ciHGph1TkhrrQeTGIYLfHxY5qIjJRed5YikSI+o+eD8Q/C16Es2zU
	 +eT3EqrG5twKh+0Ud0enfPdPIfG2diPK+wYgsOcpvv4RQHRCb3Cv1VspbrXq4vFtUe
	 tlwI1V9hljPsmhFn9hARkCPQ1TrtghCTYB+czgDy22NFFETzfCKhjQsU0Mb9ZMAt4d
	 j7CFRKdwrzuE2ZPymx5+X4q1FdtuKqeq1zaiy0bfhMMeLhKwnxX7yegG+ah4lmHt67
	 U75ydC53JaXFsdnHWKp5CN+bvYR3D1LldMIGDSorNOsxhzUL1simWe4zFio2hrSz+n
	 NvDQ1bgy/OeXA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3d50882cc2so441900966b.2
        for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 10:11:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5DDQPJbkaioPQkOLnl3ZXe/NrEW65jnW2t5iNy0N104Ofwu6+DSX3kl5zVQ5J3+Y58WhnqwdB@lists.linux.dev
X-Gm-Message-State: AOJu0YyuKqXwjtJodKWjdqiaUpmJUJ6NgURD8EHq5hvRmZIvGckAPxQv
	GTHmo7Xmf2CaqOk3Spoii/HIZDN1n0cf/ozHlQygAtU/pohl4yap7nJPdFPmLdyuEJJ9RTVcsJP
	QkIPGLUEoTedwZejFWBMxA6EXlFUrUA==
X-Google-Smtp-Source: AGHT+IE329OjaG+4rvv68YMu/5iAcKXT2Q4FHavkS+vx4IlMOGjNRQXFs42u/9jBCw3BhMHCmo37MLRkXQEiElmGlr0=
X-Received: by 2002:a17:907:7e88:b0:b3f:b7ca:26ca with SMTP id
 a640c23a62f3a-b50aaa96b30mr1274058566b.21.1760116315842; Fri, 10 Oct 2025
 10:11:55 -0700 (PDT)
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
 <d4eabdd0-dcc4-4e58-9217-9a8628f4669c@lunn.ch> <20251010075909.GE29493@pendragon.ideasonboard.com>
 <MW5PR13MB5632C7D79221CF57565DEEF2FDEFA@MW5PR13MB5632.namprd13.prod.outlook.com>
 <739c7a03558c3c8642fc6a51de4d679ecd389365.camel@perches.com> <MW5PR13MB56325771E2CB01118E02F6D1FDEFA@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To: <MW5PR13MB56325771E2CB01118E02F6D1FDEFA@MW5PR13MB5632.namprd13.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 10 Oct 2025 12:11:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLM4P+x4iE0DnuKoWfwiMEZjM2Z4D_gcU5HHk9qNUYFsg@mail.gmail.com>
X-Gm-Features: AS18NWD-xoGlhWVzBs_GMUmjjU8FFNq50NkEDbQ-7tXeXv6-1M9lIERVaLLrZ1M
Message-ID: <CAL_JsqLM4P+x4iE0DnuKoWfwiMEZjM2Z4D_gcU5HHk9qNUYFsg@mail.gmail.com>
Subject: Re: checkpatch encouragement improvements (was RE: [MAINTAINERS /
 KERNEL SUMMIT] AI patch review tools)
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: Joe Perches <joe@perches.com>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, Andrew Lunn <andrew@lunn.ch>, 
	Steven Rostedt <rostedt@goodmis.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Chris Mason <clm@meta.com>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, "Knut.omang@oracle.com" <Knut.omang@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 11:03=E2=80=AFAM Bird, Tim <Tim.Bird@sony.com> wrot=
e:
>
>
>
> > -----Original Message-----
> > From: Joe Perches <joe@perches.com>
> > On Fri, 2025-10-10 at 14:=E2=80=8A15 +0000, Bird, Tim wrote: > I have i=
deas to address the false positive rate, based on features that checkpatch.=
=E2=80=8Apl >
> > already has, as well as ideas for handling some of the concerns that ru=
nning > checkpatch.=E2=80=8Apl
> > On Fri, 2025-10-10 at 14:15 +0000, Bird, Tim wrote:
> > > I have ideas to address the false positive rate, based on features th=
at checkpatch.pl
> > > already has, as well as ideas for handling some of the concerns that =
running
> > > checkpatch.pl (or an equivalent) at build time would raise.  Some of =
these might
> > > apply to AI review as well.  Let me know if you want me to elaborate,=
 or if we
> > > should just discuss in Tokyo.
> >
> > Please elaborate.
>
> Before I rattled off my ideas, I did a quick check to see if anything lik=
e what I had
> in mind had already been suggested, and I found this:
> https://lore.kernel.org/all/cover.3dd1d0c1f15a7a7c418f20ebafc9719afc1c270=
4.1510840787.git-series.knut.omang@oracle.com/
>
> That's a submission by Knut Omang from 2017 that adds support for running
> checkpatch.pl on the whole kernel source, integrated into kbuild.
>
> It looks like it was not adopted.
>
> That patchset allows:
> 1) fine-tuning the set of items that checkpatch checks for
> 2) using a config file to control the fine tuning
> 3) allowing selection of the groups of checks (so that preferences of
> individual maintainers or sub-systems could be adhered to)
>
> My ideas for tackling false-positives was along those same lines.
> 1) determine a list of "must-have" items, that everyone supports as true-=
positives
> 2) having a way to designate groups of items that were deemed as true-pos=
itives
>      - by creating a profile of items, specific to a subsystem or maintai=
ner
>      - having the 'true-positives' profile under the control of the maint=
ainer or subsystem
> 3) creating a mechanism to tell checkpatch which profile to use
>
> In terms of runtime issues, there are two ways to "encourage (/force?)" u=
sers
> to run the checks, while still managing overhead:
> 1) add a checkpatch.pl invocation sometime during a regular build (either
> before or after the compiler invocation)
>      - My idea to avoid overhead here is to add a command-line option to =
the kernel
>        build, to indicate the number of commits to include in patch revie=
w (default to 1), and only
>        run checkpatch on either a) each commit itself, or b) the files to=
uched by each commit.
>        - OR,  only run checkpatch on source files that differ from the gi=
t index.
> 2) alternatively, add a gcc plugin that performs some set of checks simil=
ar to checkpatch.pl,
>     maybe calling checkpatch itself, but maybe just directly checking for=
 definite true-positives
>     itself.  This would involve migrating the true-positives check from c=
heckpatch into a gcc plugin.
>     - then dealing with clang builds
>
> I think there would be too much noise, and too much latency, to run
> checkpatch on the entire kernel source on every build.
>
> But my goal here is to have checkpatch issues show up like gcc errors - e=
arly in development,
> as the errors are made, so they never make it into patch emails.

Running on the source wouldn't expose things which only show up in the
patch. Missing or other S-o-b errors, missing commit msg, using 'This
patch/commit...', etc. I think it would be good if we ran checkpatch
on every patch, but start with only checks with no false positives and
ones every maintainer agrees on. Then we can add to it from there
perhaps enabling per subsystem checks.

Rob

