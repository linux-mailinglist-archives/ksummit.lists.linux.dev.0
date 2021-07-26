Return-Path: <ksummit+bounces-465-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D846B3D56B0
	for <lists@lfdr.de>; Mon, 26 Jul 2021 11:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id CCBA21C07CD
	for <lists@lfdr.de>; Mon, 26 Jul 2021 09:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05B72FB2;
	Mon, 26 Jul 2021 09:35:50 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B302572
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 09:35:49 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 330BC1FE5A;
	Mon, 26 Jul 2021 09:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1627292148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WqRdg0oLOfMjSAuXWYver+y5Ah32+KrD6NaoQ4IzZYM=;
	b=djeCAqT+yvbywdNiXddczGMQbqmXz4iR6DPJWNLGLAcVNddeXgIARNpcGI/f1vh8DH0iqG
	Mvi+BiU8Wun5aXfxJ4QS9VinPyPgPjMZEoBIQdST8GvlsMDJbR0p4fT6gIXpOZFqiz4s2S
	IuvbgpJKUurPhs3ZXISIJv95ANzTJcw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1627292148;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WqRdg0oLOfMjSAuXWYver+y5Ah32+KrD6NaoQ4IzZYM=;
	b=U7h3QUfM+22OBIevcyF5pixB0sUjNJtiluqVK/Qd5HW8owT5AaNhJI/zBnrHjGb8+qnpRG
	PaXNDb6SV+k4NzBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0455613A80;
	Mon, 26 Jul 2021 09:35:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap1.suse-dmz.suse.de with ESMTPSA
	id lAbEOvOB/mCzMgAAGKfGzw
	(envelope-from <hare@suse.de>); Mon, 26 Jul 2021 09:35:47 +0000
Subject: Re: Potential static analysis ideas
To: Julia Lawall <julia.lawall@inria.fr>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, NeilBrown <neilb@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, ksummit@lists.linux.dev
References: <20210723191023.GG25548@kadam>
 <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
 <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com>
 <162717033769.3676.6942299974175827854@noble.neil.brown.name>
 <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com>
 <CAMuHMdWL7bKUN1i1eDAi4Abc-jy3FjhO-CrsuAfN7cffQX2aHA@mail.gmail.com>
 <CAK8P3a27+pefDA7HC9u0k6Q=C8=8dEqpLik04--4pii-qX3VLQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2107261025120.5982@hadrien>
 <633614dd-dd88-03f0-c463-d97036c58216@suse.de>
 <CAMuHMdUi6+9_TWNqk5=sebpzwbC0HHRzN5AHjySQgUCvmih9Tg@mail.gmail.com>
 <alpine.DEB.2.22.394.2107261125380.6460@hadrien>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <45ed0e03-2eb8-8ed8-898b-4f5f4d31a4a1@suse.de>
Date: Mon, 26 Jul 2021 11:35:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2107261125380.6460@hadrien>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 7/26/21 11:28 AM, Julia Lawall wrote:
>>>> Also, over 230 files contain functions that return both NULL and ERR_PTR.
>>>> A random example, chosen for conciseness, is the following from
>>>> fs/overlayfs/inode.c:
>>>>
>>>> struct inode *ovl_lookup_inode(struct super_block *sb, struct dentry *real,
>>>>                                  bool is_upper)
>>>> {
>>>>        struct inode *inode, *key = d_inode(real);
>>>>
>>>>           inode = ilookup5(sb, (unsigned long) key, ovl_inode_test, key);
>>>>        if (!inode)
>>>>                   return NULL;
>>>>
>>>>           if (!ovl_verify_inode(inode, is_upper ? NULL : real,
>>>>                                 is_upper ? real : NULL, false)) {
>>>>                   iput(inode);
>>>>                   return ERR_PTR(-ESTALE);
>>>>           }
>>>>
>>>>           return inode;
>>>> }
>>>>
>>> And that I would consider a coding error.
>>> If a function is able to return an error pointer it should _always_
>>> return an error pointer; here it would be trivial to return -ENXIO
>>> instead of NULL in the first condition.
>>>
>>> Not doing so is just sloppy programming IMO.
>>
>> In this case I agree.
> 
> I looked at the calling context, and it is not so obvious.  There are
> different behaviors in the two cases at both callsites.  It is like what
> Dan describes.  If the thing is not available, we just move on.  If it is
> available some action is needed.  If there is an actual error, some error
> handling is needed.
> 
But isn't 'not available' an error, too?
And isn't that exactly why we have individual errnos?

Why do we have to introduce different classes of errors (errno, NULL 
pointer), when we could have used a simple errno lik -ENXIO?
And, of course, documentation for that function outlining what exactly 
the meaning of the individual error numbers is.
But then we would need that anyway to clarify how the caller should 
interpret a 'NULL' return value.

So: not convinced :-)

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

