Return-Path: <ksummit+bounces-2484-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5241CBCDB6C
	for <lists@lfdr.de>; Fri, 10 Oct 2025 17:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8493918900B8
	for <lists@lfdr.de>; Fri, 10 Oct 2025 15:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59912F7AC4;
	Fri, 10 Oct 2025 15:07:55 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232CB2F5A39
	for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 15:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760108875; cv=none; b=Ytz57D51MoDNHE4jOvad6noZ8ZMEx6bhxt9Pd8x+cCikZnyS7i+Tm2YLNtT7lZlLDE0t3+PC6tdb0xFG6FBFYTRGEbnFZFffivEGG7SgKoHfb4bEXA5MuyztGtGb/TzeSba2zYNvrXwyU8f/ecRjxukJTUGe7CrA/k2QL3J6cdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760108875; c=relaxed/simple;
	bh=JD5O3Yp22/WGEDeJoSJZXgxNZOsQFRRfc5EsFdREWpo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Da72S2wgpIU7dCrVjHAUj+7Lds8U6bIBpa22hcNRYqpLfzOoC622/a+8/EgZlSI3YmuAI4oe4QBDtvvnG4F4v4a4vhPMp2dHHldUsMkBd1KYaogLEdswBvyGbILcOxlv19ub4RtpoT4yvtJEQHEZ575XM0PfBDIacL/3Esi98Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id B4251B8A53;
	Fri, 10 Oct 2025 15:07:46 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf13.hostedemail.com (Postfix) with ESMTPA id DDFE02001E;
	Fri, 10 Oct 2025 15:07:43 +0000 (UTC)
Message-ID: <739c7a03558c3c8642fc6a51de4d679ecd389365.camel@perches.com>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
From: Joe Perches <joe@perches.com>
To: "Bird, Tim" <Tim.Bird@sony.com>, "laurent.pinchart@ideasonboard.com"
	 <laurent.pinchart@ideasonboard.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Steven Rostedt <rostedt@goodmis.org>, James Bottomley	
 <James.Bottomley@hansenpartnership.com>, Chris Mason <clm@meta.com>, 
 "ksummit@lists.linux.dev"	 <ksummit@lists.linux.dev>, Dan Carpenter
 <dan.carpenter@linaro.org>, Alexei Starovoitov <ast@kernel.org>, Rob
 Herring <robh@kernel.org>
Date: Fri, 10 Oct 2025 08:07:39 -0700
In-Reply-To: <MW5PR13MB5632C7D79221CF57565DEEF2FDEFA@MW5PR13MB5632.namprd13.prod.outlook.com>
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
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: 6mhyakgx6msjo7pn8qa7nq1rtzopttdj
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: DDFE02001E
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+rx54nA7EPKMR7GP60u+0/gJnyd3PFCPQ=
X-HE-Tag: 1760108863-459776
X-HE-Meta: U2FsdGVkX19ge3TMDkU4cfxdrtu7E2m+h6/unsBC6s2x/6q+plFKldlkbxxkKjFzqdRHi+d3uGhnWKGybIv/o2oA7qix8x61WHGbXFkxCTTfKVyrdIZ3XrQHqZUDQd4YloIrzGr0kJU4gn9VfaocHzQEU+cZdeGBCRME0d2Ku9lHnfNzs+IUuPR8qihC4x7v3oAjIwsDxbM0GwtnDBG2HBPImNSWVUBvo9EHug4otia9EUCl0ijLxJfcYek9gOxHS8tf7mln4CJropNzVcs2nllMQhM1oPGp9v9mlma51nCau85Q4Q7nqTPx82QAkRza

On Fri, 2025-10-10 at 14:15 +0000, Bird, Tim wrote:
> I have ideas to address the false positive rate, based on features that c=
heckpatch.pl
> already has, as well as ideas for handling some of the concerns that runn=
ing
> checkpatch.pl (or an equivalent) at build time would raise.  Some of thes=
e might
> apply to AI review as well.  Let me know if you want me to elaborate, or =
if we
> should just discuss in Tokyo.

Please elaborate.

