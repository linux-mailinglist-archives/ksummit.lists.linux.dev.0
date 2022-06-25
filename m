Return-Path: <ksummit+bounces-710-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7709355A853
	for <lists@lfdr.de>; Sat, 25 Jun 2022 11:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC5C2280C9C
	for <lists@lfdr.de>; Sat, 25 Jun 2022 09:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8005923B5;
	Sat, 25 Jun 2022 09:10:37 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501ED17C8
	for <ksummit@lists.linux.dev>; Sat, 25 Jun 2022 09:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E11C3411C;
	Sat, 25 Jun 2022 09:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656148236;
	bh=yMgjit10a3SU3ztFXsGAvHUutL+z27sCJak6YFXnNcY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cf4Y4oNZLL5/5OrrbAvL2SFzEkN2gRymg+TVmgCvvicyn2vyo73is6SO8UNDH15mz
	 TacPDrxl/dvwTklyRSDZFNXguLPoP8IEs2xI7CnknU05AR1Ys6FsJr3vDpaDJUfX4A
	 YOLOKIOpNchiWQaehymMpNptSPiwaj3zryXfz5PaOzZc2VCvW4hIQKRQ8aj4dscPNk
	 O7tva2JLiVRH5Grdap9rJmlF5GWefhsDrr04O4MHNUPDdQc0ioEis5M5TrxeI95Mzv
	 4QJaPhZYUdffCOqkpp8UCiZ3oMWvfLM7N5AOeD4pT6bPaG9PLaMnxbNKkG3yV9L5OY
	 M96MbHzqYobbA==
Date: Sat, 25 Jun 2022 10:10:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Jani Nikula <jani.nikula@intel.com>,
 ksummit-discuss@lists.linuxfoundation.org, ksummit@lists.linux.dev, Markus
 Heiser <markus.heiser@darmarit.de>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could
 be
Message-ID: <20220625101029.67f14c4c@sal.lan>
In-Reply-To: <87tu891xfv.fsf@meer.lwn.net>
References: <87sfo3nh3t.fsf@meer.lwn.net>
	<20220618092447.5ebed314@sal.lan>
	<875ykrrb45.fsf@intel.com>
	<20220623105747.079ac92b@sal.lan>
	<87a6a38plu.fsf@meer.lwn.net>
	<20220624083307.159824bd@sal.lan>
	<87tu891xfv.fsf@meer.lwn.net>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 24 Jun 2022 16:57:56 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab@kernel.org> writes:
> 
> > Em Thu, 23 Jun 2022 07:40:45 -0600
> > Jonathan Corbet <corbet@lwn.net> escreveu:  
> >> I've actually, in a spare moment or two, been doing some profiling of
> >> the kernel docs build and trying to track down the sources of the
> >> slowness.  I am thinking that nearly 700 *million* calls to the iterator
> >> for the C-domain symbol list might have something to do with it...  
> >
> > Wow, that's a lot!  
> 
> Just for the curious ...
> 
> The Sphinx C domain code makes this elaborate tree data structure out of
> all the identifier names it has picked up - including the names of
> function parameters when they are provided in prototypes for some
> reason.  This is the structure that is consulted whenever we want to
> resolve a cross-reference, which is fairly often with automarkup
> enabled.
> 
> How does it work?  The algorithm is, as far as I can tell:
> 
>  - Serialize the whole tree in a sort of breadth-first traversal
> 
>  - Make a linear pass through the *entire* list, comparing the
>    identifier name with each entry and accumulating a list of all the
>    matches found.
> 
>  - Return the first match and throw away the rest.
> 
> The result is O(n^2) behavior and, in the kernel docs build, n gets to
> be fairly large.
> 
> I went in with a crowbar and sledgehammer and replaced some of the list
> searches with a dict lookup, resulting in about a 20% speedup in the
> full htmldocs build with Sphinx 5.0.2. 

Great to have a 20% speedup here! Yet, I would expect an even better
performance improvement by replacing 700 million calls from linear search
to dict, as it would change from O(n^2) to O(1) at the average case [1],
but the speedup gain actually depends on the actual number of symbols we
have defined.

[1] According with:
	https://wiki.python.org/moin/TimeComplexity#dict
    Worse case is O(n) - when collisions are common which is unlikely.

> A couple of automarkup
> optimizations result in about a 27% speedup overall.  And I didn't break
> any cross-references.

Great!

> I think it's possible to do better, but this is a start.  I'll post the
> automarkup changes as soon as I can, but I need to verify them across
> the whole range of Sphinx versions. 

> For the Sphinx stuff, I'll need to
> turn my hatchetwork into something presentable and figure out how to
> contribute it upstream, but it seems worth the effort.

Indeed.

Regards,
Mauro

