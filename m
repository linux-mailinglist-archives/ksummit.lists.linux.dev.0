Return-Path: <ksummit+bounces-2491-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3ABBCE1E0
	for <lists@lfdr.de>; Fri, 10 Oct 2025 19:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 412AE3AA9FE
	for <lists@lfdr.de>; Fri, 10 Oct 2025 17:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C762222A9;
	Fri, 10 Oct 2025 17:42:09 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583E74A02
	for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 17:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760118128; cv=none; b=Cn78rsqfJ8hZK3/aKtsKXI7qoHwthiIkKKC2ixGOl4NsDuCvoxZF/GcSmkUTkVoXSmCPiD5ZEiTxGRUXkKfeUZg2GtgMU3LzAIVytmqxAjB3xxbU70m2PqNz+ho5rCFpjf5BxaVHGClMdLXL4O3fxSq+9vw7h/SEbiWMCSrWwwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760118128; c=relaxed/simple;
	bh=P6RSZgE6D25noDDORoyYdvSdtcH8mWmzFsrLo0Hru/E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AYpFKYXlUZ0oZ9zi9FQ/Lg2HsT6JEJ20syYraOQkUKvMcVUsm8Ibi4usVqnun40QPcbfg3bg6WK01xlJEhnHKYn0vLxinSPIirEVHMaWTrt/jmxaCfieCnCdk+ii34u24Kc1sa/RQl/xznTyEYd/2Bx8QjDeZXByHIcRgPvpp8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 64BB78732A;
	Fri, 10 Oct 2025 17:42:04 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id 28E4041;
	Fri, 10 Oct 2025 17:42:02 +0000 (UTC)
Date: Fri, 10 Oct 2025 13:42:04 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Joe Perches <joe@perches.com>
Cc: "Bird, Tim" <Tim.Bird@sony.com>, "laurent.pinchart@ideasonboard.com"	
 <laurent.pinchart@ideasonboard.com>, Andrew Lunn <andrew@lunn.ch>, James
 Bottomley <James.Bottomley@hansenpartnership.com>, Chris Mason
 <clm@meta.com>, "ksummit@lists.linux.dev"	 <ksummit@lists.linux.dev>, Dan
 Carpenter <dan.carpenter@linaro.org>, Alexei Starovoitov <ast@kernel.org>,
 Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <20251010134204.38799407@gandalf.local.home>
In-Reply-To: <a79e5d12fa755dcd342b8f841cb87b52ffc0f6e7.camel@perches.com>
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
	<a79e5d12fa755dcd342b8f841cb87b52ffc0f6e7.camel@perches.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 28E4041
X-Stat-Signature: 5z15h6496x6brdi58za1s8uowxgdeerj
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/js+lgwYMqjdwhMlfCzyOzBQ4uIJT1HTc=
X-HE-Tag: 1760118122-794713
X-HE-Meta: U2FsdGVkX1//wilqwW0SLT9qgyL2Vvv80UtNKtNfV/KfBYKk1W4Gpr8VM2PdaCE13wzHQwGaCSTJNpogyArStdKfI/ABW251Gpu9QpjQCyQBF3hYP/pVMphR4RBLFJjKjvdl7JzYjk9udJl5K16lr74TrQHcfEJS822ygV6vX8vSB3yIYn30mEo3Kfw6216wplxz5agNNr7cqk5Vdrg3QFPWdDHDUtAhsJmwgE6pL+q2HxyA7h0Jo6UCYsN0wd+BtrBv1L3EsBB1+54FptImgVmcZAGsqlcHl4ZSq/GjuVlANMWvn4kXhZVb5353YrzcYDbYMjSd9kvFo9gbZlsPS9FlF7xG8kTElyy7xnN3BVREBXwajsJQtU9ctFJNuXOCKDn9dn6841hsVee5C8otUpiYI/Ygopd2t24nV/HkL4X6a3ux3E6g6w==

On Fri, 10 Oct 2025 09:47:23 -0700
Joe Perches <joe@perches.com> wrote:

> I recall suggesting something about that once.
> Basically, ignore the files.
> 
> https://lore.kernel.org/lkml/a587dac9e02cfde669743fd54ab41a3c6014c5e9.camel@perches.com/

Something like that would be nice.

-- Steve

