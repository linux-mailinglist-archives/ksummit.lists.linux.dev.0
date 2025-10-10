Return-Path: <ksummit+bounces-2488-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BBABCDFB3
	for <lists@lfdr.de>; Fri, 10 Oct 2025 18:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2211C4E88C0
	for <lists@lfdr.de>; Fri, 10 Oct 2025 16:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739612F83BA;
	Fri, 10 Oct 2025 16:47:30 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD051FBCA1
	for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 16:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760114850; cv=none; b=kkd/zSCrNMONGtMwqueaFH0MUYhs7DG/rAlzXPvklNkGtEOXIOi09Prztl0y016ImpshM4US/wijxrrc9GIyhwuN/hkR+ByDuQE0qF6PpcmyGe1wPZjVR27xXhYVD97jrWN9q0vkPAhjWMBBtOfAwfdnf7pEsw/vqdJ8eS0Vl0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760114850; c=relaxed/simple;
	bh=f/y3d36i7NieS+nfCHuSWnluagRuChHpDhyNt4/OG2s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BtoWdw2K3SUWX768v6xyhsVt09oU0VS8nKbp404I4uCvWKSY5T0lMtGgP2F7mmrchq07H24ovODP2UPyWCvplgZ9AeLZi2NL9wKPSE5oVM3tMn3m4xRKztIb2nWh/evSZsEtz1TKBqyNdYsUsB3SZNvdTQYpI74LIwhn9sRQwkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id DFDB41403E3;
	Fri, 10 Oct 2025 16:47:26 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf15.hostedemail.com (Postfix) with ESMTPA id 0D5A71B;
	Fri, 10 Oct 2025 16:47:23 +0000 (UTC)
Message-ID: <a79e5d12fa755dcd342b8f841cb87b52ffc0f6e7.camel@perches.com>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
From: Joe Perches <joe@perches.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Bird, Tim" <Tim.Bird@sony.com>, "laurent.pinchart@ideasonboard.com"	
 <laurent.pinchart@ideasonboard.com>, Andrew Lunn <andrew@lunn.ch>, James
 Bottomley <James.Bottomley@hansenpartnership.com>, Chris Mason
 <clm@meta.com>,  "ksummit@lists.linux.dev"	 <ksummit@lists.linux.dev>, Dan
 Carpenter <dan.carpenter@linaro.org>, Alexei Starovoitov <ast@kernel.org>,
 Rob Herring <robh@kernel.org>
Date: Fri, 10 Oct 2025 09:47:23 -0700
In-Reply-To: <20251010121127.05381ba8@gandalf.local.home>
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
	 <20251010121127.05381ba8@gandalf.local.home>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: sa5h5iu3sogsayqcpyfho7snaqaasenf
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 0D5A71B
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+1g7SQSYggwFV/rH5iJHHqFnQKVHXH8vI=
X-HE-Tag: 1760114843-776310
X-HE-Meta: U2FsdGVkX1/du5S5wwqwI959gBlqABe1UryIbNdx8gWmgjNMhYBwMc35ome9ZBvJM2zHJjCVkeO8uxjYpwp+piwyUNHHS4mlWAduiKOYoZ4okNuPqqDzeR1HEbYosXDT3BH2655NXOBdHGBgH7QrV5Z9uC/5EBQ9bQchawVgpXcHEJ2J0rWNSTXujTTmjmHNc7YnmWt8nrkMdP50gvlUAHHdMzlsOE8w83ZQ86R9O/qM/zpMr7btrBdNF+yte//z1ZVzet9ldUasgD5ttZJTPe9Lu/fr//gvCoWvycAcPPzkfypBasnLlmUkXHF+aV+9HqI05qYDbE1StkLo3KiltMTwtJayginIbEzC06hERGw+bApg+Gx4SrtDBKZ9WfqkRHc4u4eZhAIep44PwJYutw==

On Fri, 2025-10-10 at 12:11 -0400, Steven Rostedt wrote:
> On Fri, 10 Oct 2025 08:07:39 -0700
> Joe Perches <joe@perches.com> wrote:
>=20
> > On Fri, 2025-10-10 at 14:15 +0000, Bird, Tim wrote:
> > > I have ideas to address the false positive rate, based on features th=
at checkpatch.pl
> > > already has, as well as ideas for handling some of the concerns that =
running
> > > checkpatch.pl (or an equivalent) at build time would raise.  Some of =
these might
> > > apply to AI review as well.  Let me know if you want me to elaborate,=
 or if we
> > > should just discuss in Tokyo. =20
> >=20
> > Please elaborate.
>=20
> Note, checkpatch.pl fails on pretty much anything in include/trace, as
> those files contain complex macros that are basically their own language.
> Anything that tries to make them follow kernel conventions simply makes
> the output uglier and harder to read.

I recall suggesting something about that once.
Basically, ignore the files.

https://lore.kernel.org/lkml/a587dac9e02cfde669743fd54ab41a3c6014c5e9.camel=
@perches.com/

