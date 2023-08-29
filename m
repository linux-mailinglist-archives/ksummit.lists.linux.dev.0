Return-Path: <ksummit+bounces-1068-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2051B78C0B8
	for <lists@lfdr.de>; Tue, 29 Aug 2023 10:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55931280F84
	for <lists@lfdr.de>; Tue, 29 Aug 2023 08:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F52014AB7;
	Tue, 29 Aug 2023 08:46:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A982109
	for <ksummit@lists.linux.dev>; Tue, 29 Aug 2023 08:46:11 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id B162521861;
	Tue, 29 Aug 2023 08:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1693298769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=75hUwRG0pJwOHrkkTuwvJBCJ7Ft5hmgzEuTnmdG0wdg=;
	b=MScyU81oiQWsNJ0F+L7++Y502+P7k+SEE1I14CZ0RLGH6WvgVTbCVhOQPhjKHyzTQH88pP
	+9EqZjSG7sk4OL7DBlm1UnDZPy90UyR344bJt7fwo+WdiVKBVKWd2vrzA9qMncGnmY/M3h
	cipa/GS2e2P7aiRcaiTNTEofnGpb/7k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1693298769;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=75hUwRG0pJwOHrkkTuwvJBCJ7Ft5hmgzEuTnmdG0wdg=;
	b=cbJWaEHZyfc+QTHUeEaR+eXKRIxrs0Y278qXLXxXHP49EV8TIbn4+sKu6MgTcyCsBJAknl
	fgY+OTfJEMCSwTCg==
Received: from pobox.suse.cz (pobox.suse.cz [10.100.2.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 4CAC52C142;
	Tue, 29 Aug 2023 08:46:09 +0000 (UTC)
Date: Tue, 29 Aug 2023 10:46:09 +0200 (CEST)
From: Miroslav Benes <mbenes@suse.cz>
To: Donald Buczek <buczek@molgen.mpg.de>
cc: Solar Designer <solar@openwall.com>, oss-security@lists.openwall.com, 
    Vegard Nossum <vegard.nossum@oracle.com>, Jiri Kosina <jkosina@suse.cz>, 
    ksummit@lists.linux.dev
Subject: Re: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues
 -- security@korg vs. linux-distros@
In-Reply-To: <12aa367f-9934-7450-1016-fe303c72cc5a@molgen.mpg.de>
Message-ID: <alpine.LSU.2.21.2308291043590.21665@pobox.suse.cz>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm> <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com> <20230816152621.GA8252@openwall.com> <12aa367f-9934-7450-1016-fe303c72cc5a@molgen.mpg.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

[ apologies for a slight off topic ]

Hi,

On Fri, 25 Aug 2023, Donald Buczek wrote:

> We go a long way to avoid rebooting. This might be as easy as disabling 
> unused dynamic modules by just removing the .ko files from userspace, 
> but sometimes we even convert an upstream fix into a loadable module 
> which uses ftrace to replace or wrap the buggy functions in the running 
> systems. A "reboot party" would only be a measure of last resort.

the kernel live patching infrastructure might help you with this. See 
Documentation/livepatch/ and samples/livepatch/ in the kernel tree.

Regards,
Miroslav

