Return-Path: <ksummit+bounces-2492-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50559BCE620
	for <lists@lfdr.de>; Fri, 10 Oct 2025 21:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE2D919A8052
	for <lists@lfdr.de>; Fri, 10 Oct 2025 19:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6A83019D3;
	Fri, 10 Oct 2025 19:21:55 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3B03019CC
	for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 19:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760124114; cv=none; b=uDQesXwu+7WQepyuJQ3UIHh9keorIovYzn+c7UjYtB5738koHfkjEya2kqFBwrYWB2QXMHSlfjBDagvZ22tzkACH/eofZzWzNn433m93I7AT4YXf7O8IfENsYxi+8Z/4yud9pbZ7jOCtSNC7MrP7zk7KcD1JQXuelVNb7BrmO+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760124114; c=relaxed/simple;
	bh=gvfpPdYlhj6utnlHUF794mIIhFANwdWEu46WK/g2FMo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XcYelca3YMWSBK2nlMfdj0ZuIsfT1kXE4vT1SuxSkJogAttcFpTA3JadKxa0tds+G1/ZOQbo/rSsMY7rw/mWUQA1zy3NGXpDasLa0d8Xbhc9x6fklnWSat468VceOc9eAZ8EKFstLlRpoPK7JWd9j5A0tBYQ9Vjj5c+5s9KlL4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id D2EE31DFBB8;
	Fri, 10 Oct 2025 19:21:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id F18C46000C;
	Fri, 10 Oct 2025 19:21:41 +0000 (UTC)
Message-ID: <25c4b2498390b93146698e90e5aad936f677cd2b.camel@perches.com>
Subject: Re: checkpatch encouragement improvements (was RE: [MAINTAINERS /
 KERNEL SUMMIT] AI patch review tools)
From: Joe Perches <joe@perches.com>
To: Rob Herring <robh@kernel.org>, "Bird, Tim" <Tim.Bird@sony.com>
Cc: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
  Andrew Lunn <andrew@lunn.ch>, Steven Rostedt <rostedt@goodmis.org>, James
 Bottomley	 <James.Bottomley@hansenpartnership.com>, Chris Mason
 <clm@meta.com>,  "ksummit@lists.linux.dev"	 <ksummit@lists.linux.dev>, Dan
 Carpenter <dan.carpenter@linaro.org>, Alexei Starovoitov <ast@kernel.org>,
 "Knut.omang@oracle.com" <Knut.omang@oracle.com>
Date: Fri, 10 Oct 2025 12:21:40 -0700
In-Reply-To: <CAL_JsqLM4P+x4iE0DnuKoWfwiMEZjM2Z4D_gcU5HHk9qNUYFsg@mail.gmail.com>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
	 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
	 <20251008192934.GH16422@pendragon.ideasonboard.com>
	 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
	 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
	 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
	 <20251009091405.GD12674@pendragon.ideasonboard.com>
	 <20251009103019.632db002@gandalf.local.home>
	 <d4eabdd0-dcc4-4e58-9217-9a8628f4669c@lunn.ch>
	 <20251010075909.GE29493@pendragon.ideasonboard.com>
	 <MW5PR13MB5632C7D79221CF57565DEEF2FDEFA@MW5PR13MB5632.namprd13.prod.outlook.com>
	 <739c7a03558c3c8642fc6a51de4d679ecd389365.camel@perches.com>
	 <MW5PR13MB56325771E2CB01118E02F6D1FDEFA@MW5PR13MB5632.namprd13.prod.outlook.com>
	 <CAL_JsqLM4P+x4iE0DnuKoWfwiMEZjM2Z4D_gcU5HHk9qNUYFsg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: F18C46000C
X-Stat-Signature: 78ct55f58acgytaibxg57w4zm1z3moqi
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+2cmIUNmaehDjVfyR5DfyGpYGq+y6q/Wg=
X-HE-Tag: 1760124101-686436
X-HE-Meta: U2FsdGVkX196E3oFTfnSWI3h6LLQkRqE2kT+5OXYMRleJGXwsZygP0PNfm78dxA4zwQXYde2xUjGOGzUaSc2t+2+OJvb4f9L4yCQ6LJhYfZt6s7ylVifuPoT9Os7q5B74T/iQTYaKgH2Xzi3dZiHgW6U3njbXrX7eWOUj9HxH6AtbbGJu7qto60pJydbfyFBOjylOjdrXbNx6fz/rnhaY3viiOPt7KHGhnbZnbn1R+AePjLNCR3dI2l2+iKI4ZOPzbEHnDVQQ2k9ODrFpHFcNaX2CSlEkUCan8lmLIPcxGZi/IM0AFRRZG+mZs6i5tLMo6V05DcXuWeAqI244bCpim3ursZCUSYXntCpBJVR/NadXL7g9hAD8wtJ6rCa84ckuP3bslOxhu8=

On Fri, 2025-10-10 at 12:11 -0500, Rob Herring wrote:
> On Fri, Oct 10, 2025 at 11:03=E2=80=AFAM Bird, Tim <Tim.Bird@sony.com> wr=
ote:
> > Before I rattled off my ideas, I did a quick check to see if anything l=
ike what I had
> > in mind had already been suggested, and I found this:
> > https://lore.kernel.org/all/cover.3dd1d0c1f15a7a7c418f20ebafc9719afc1c2=
704.1510840787.git-series.knut.omang@oracle.com/
> >=20
> > That's a submission by Knut Omang from 2017 that adds support for runni=
ng
> > checkpatch.pl on the whole kernel source, integrated into kbuild.
> >=20
> > It looks like it was not adopted.
> >=20
> > That patchset allows:
> > 1) fine-tuning the set of items that checkpatch checks for
> > 2) using a config file to control the fine tuning
> > 3) allowing selection of the groups of checks (so that preferences of
> > individual maintainers or sub-systems could be adhered to)
> >=20
> > My ideas for tackling false-positives was along those same lines.
> > 1) determine a list of "must-have" items, that everyone supports as tru=
e-positives
> > 2) having a way to designate groups of items that were deemed as true-p=
ositives
> >      - by creating a profile of items, specific to a subsystem or maint=
ainer
> >      - having the 'true-positives' profile under the control of the mai=
ntainer or subsystem
> > 3) creating a mechanism to tell checkpatch which profile to use
[]
> I think it would be good if we ran checkpatch
> on every patch, but start with only checks with no false positives and
> ones every maintainer agrees on. Then we can add to it from there
> perhaps enabling per subsystem checks.

checkpatch is stupid.
checkpatch has very few checks with no false positives.

Maybe have something like a per-subdirectory/subsystem
.checkpatch.conf file and have checkpatch walk up the directory chain
when checking patches or files.


