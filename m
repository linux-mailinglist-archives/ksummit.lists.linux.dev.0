Return-Path: <ksummit+bounces-2138-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D34B22C29
	for <lists@lfdr.de>; Tue, 12 Aug 2025 17:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B59E87B6596
	for <lists@lfdr.de>; Tue, 12 Aug 2025 15:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D36302CDC;
	Tue, 12 Aug 2025 15:49:16 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4997B2F8BE9
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 15:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755013756; cv=none; b=EOGz8hUeBNGwrNfnCU1jYwus07ufhK10O5pb3VGBseIDNlG50nbYMUu+waAxyWoo/Jazmi7o/sNlyPogJ7u6o9LVFJzB6m8B5GBXVl2l9uJ/Uc+tfhfeKfHkT8RmahfTXCaxMjJsAvnCW5bwCCUqjCN50ukQS/K7iMnZYNt5cOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755013756; c=relaxed/simple;
	bh=XKQJEyaTMM/FZCc0U0jq3GKBTr3eLeyMR6W/HyWefT4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uTOQmeYrw62fLLCBxkyJp67LogJPP6Qyal/vTy3noNOoAIDlF4qmbBqJJJqrmRxUMG9mTjSFFAwb7hxiXezV6zRW4GBkPEoRZWdjpm/DuwDqnpHHsHIXCgbG8PHOCCHiG/GAt73xC4HCYUwrZoVODYubB2a4Kxr0ziCoqihEdh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id E3F87825CE;
	Tue, 12 Aug 2025 15:49:12 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id 1DA9317;
	Tue, 12 Aug 2025 15:49:11 +0000 (UTC)
Date: Tue, 12 Aug 2025 11:49:56 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Sasha Levin <sashal@kernel.org>
Cc: "Luck, Tony" <tony.luck@intel.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Jiri Kosina
 <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250812114956.40dbb2fe@gandalf.local.home>
In-Reply-To: <aJpupN1KztXyglnN@lappy>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<aJJEgVFXg4PRODEA@lappy>
	<12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
	<f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
	<aJpnStlxDUsGNPuA@agluck-desk3>
	<aJpupN1KztXyglnN@lappy>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 1DA9317
X-Stat-Signature: tfue73rgwj6z9h8duj9ewruyjpcmyirk
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18RBTuFsSqZrD6PB+mTTlzxuKyhFvQnxhU=
X-HE-Tag: 1755013751-122654
X-HE-Meta: U2FsdGVkX19njC6MzdMgbgDh6jFJPxGKQcDigBOWS2O8trtvQS46MXFdgLblJ0+Yxwx0ewZ2Grjg4GFfk0vmV8QKUtbfawzEQdXvPI1389xhllJnJkYGWQo03BHor8mwN0gAY1PWKoI7kYbmqVOthMbFrU7Db1sOk4c/WrUDCbyxAfqm+Xi7sT70vljTtbQBdocOwGQ9/s/ni8vHVNjvUZkcrqbXBbqORoFP4ejlzqt2Y2KZgJ7/2ur0xJQZuW5TO2ESJAm1WHvUG3IT7UO7Ktb8UzfoNKd3q5mB7lSBk336zfBvnaWlaNS0FsH0uf+zugLvhspNJarfchW9217ivcGCs0qCondi

On Mon, 11 Aug 2025 18:28:52 -0400
Sasha Levin <sashal@kernel.org> wrote:

> We have the following in our docs:
> 
>          code from contributors without a known identity or anonymous
>          contributors will not be accepted. All contributors are required
>          to "sign off" on their code
> 
> Which requires a real, known, human identity behind the "Signed-off-by"
> tag.

I guess the real question is, if you have AI write the code, do you have
the right to add your Signed-off-by to it? Especially if you don't know
what that AI was trained on.

Does the Signed-off-by mean if later on, we find that the AI used an
patented algorithm, the one that added their SoB can be in legal trouble?

-- Steve

